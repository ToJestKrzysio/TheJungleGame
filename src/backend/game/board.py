from __future__ import annotations

import logging
from collections import Counter, deque, namedtuple
from copy import copy, deepcopy
from itertools import product
from typing import Dict, List, Set, Tuple, Iterable, Optional, TYPE_CHECKING

import numpy as np

from game import Cell, MoveNotPossibleError, unit, get_unit, AbstractModel, ValuePolicyModel, \
    AStarModel, Position
from game import moves as unit_moves

if TYPE_CHECKING:
    from mcts import Node, Root


class Board(np.ndarray):
    """
    Class representing current board state.

    positions: dictionary {Unit instance: tuple representing current position}.
    moves: dictionary {Unit instance: set of tuples of valid moves}.
    previous_board: reference to previous board instance, if previous board
        does not exist equals None.
    last_moves: List
    """
    positions: Dict[unit.Unit, Position]
    moves: Dict[unit.Unit, Set[unit_moves.Move]]
    previous_board: Board | None
    last_moves: List[deque, deque]
    move_count: int
    white_move: bool
    MAX_REPETITIONS: int = 3
    game_over: bool
    value: float = 0
    outcome: float = 0
    model_white: Optional[AbstractModel]
    model_black: Optional[AbstractModel]

    def __new__(cls, cells: np.ndarray | List[List[Cell]]):
        obj = np.asarray(cells, dtype=Cell).view(cls)
        return obj

    def __array_finalize__(self, obj):
        """ Finalizes creation of new instance on Board. """
        if obj is None:
            return
        self.positions = self.get_positions()
        self.moves = self.get_moves_for_all_units()
        self.previous_board = None
        self.last_moves = [
            deque([None] * (type(self).MAX_REPETITIONS * 2 - 1)),
            deque([None] * (type(self).MAX_REPETITIONS * 2 - 1)),
        ]
        self.white_move = True
        self.move_count = 0
        self.game_over = False
        self.model_white = None
        self.serializer = BoardSerializer

    def get_positions(self) -> dict[unit.Unit, Position]:
        """
        Generates dictionary of units on the board.

        :return: dict[unit_value] = Position(row_id, column_id)
        """
        positions = dict()
        for row_id in range(self.shape[0]):
            for column_id in range(self.shape[1]):
                current_cell = self[row_id, column_id]
                if current_cell:
                    positions[current_cell.occupant] = Position(y=row_id, x=column_id)
        return positions

    def get_moves_for_all_units(self) -> Dict[unit.Unit, Set[unit_moves.Move]]:
        """ Collects moves of all units and places them into a dictionary. """
        return {current_unit: self.get_single_unit_moves(position)
                for current_unit, position in self.positions.items()}

    def get_single_unit_moves(self, position: Position) -> Set[unit_moves.Move]:
        """ Using base_moves determines valid ones and returns a set of valid moves for a unit. """
        all_moves = [self._process_move(position, move) for move in unit_moves.base_moves]
        return {position for is_valid, position in all_moves if is_valid}

    def is_position_valid(self, position: Position) -> bool:
        """ Checks if position is inside the board space. """
        return position.y in range(self.shape[0]) and position.x in range(self.shape[1])

    @staticmethod
    def get_new_position(position: Position, move: unit_moves.Move) -> Position:
        """ Returns new position as a tuple. """
        return Position(y=position.y + move.y, x=position.x + move.x)

    def _process_move(self, position: Position, move: unit_moves.Move
                      ) -> Tuple[bool, unit_moves.Move]:
        """
        Checks if move in the given direction is valid.
        In case move is invalid and animal can jump, checks also a jump move.
        """
        INVALID_POSITION = (False, unit_moves.invalid_move)
        old_cell = self[position]
        new_position = self.get_new_position(position, move)

        if not self.is_position_valid(new_position):
            return INVALID_POSITION

        new_cell = self[new_position.y, new_position.x]
        if new_cell.water and old_cell.occupant.jumps:
            move = unit_moves.get_jump_move(move)
            if not self.validate_jump_move(new_position, move):
                return INVALID_POSITION
            new_position = self.get_new_position(position, move)
            new_cell = self[new_position[0], new_position[1]]

        if old_cell.can_capture(new_cell):
            return True, move

        return INVALID_POSITION

    def validate_jump_move(self, position: Position, move: unit_moves.Move) -> bool:
        """
        Checks if jump is considered valid.
        Jump is valid if all water cells along its path are empty.

        :param position: Position of first water cell as tuple [x_position, y_position].
        :param move: Move instance.

        :return: True if move is valid False otherwise.
        """
        xs = tuple(range(position.x, position.x + move.x - move.sign, move.sign)) or (position.x,)
        ys = tuple(range(position.y, position.y + move.y - move.sign, move.sign)) or (position.y,)
        positions = product(ys, xs)
        water_cells = [self[position] for position in positions]
        return not any(water_cells) and all(map(lambda x: x.water, water_cells))

    def get_repetitions(self) -> Tuple[int, int]:
        """ Get number of repetitions for player and the opponent. """
        player, opponent = self.last_moves
        return self._get_repetition(player), self._get_repetition(opponent)

    @staticmethod
    def _get_repetition(moves: List) -> int:
        """ Calculates maximum number of repetitions within the given list of moves. """
        counter = Counter(moves)
        del counter[None]
        most_common = counter.most_common(1)
        return most_common[0][1] if most_common else 0

    @property
    def white_moves(self) -> Dict[unit.Unit, Set[unit_moves.Move]]:
        """ Returns all valid moves of white player. """
        return {current_unit: moves for current_unit, moves in self.moves.items()
                if current_unit.white}

    @property
    def black_moves(self) -> Dict[unit.Unit, Set[unit_moves.Move]]:
        """ Returns all valid moves of black player. """
        return {unit_: moves for unit_, moves in self.moves.items() if not unit_.white}

    @staticmethod
    def no_valid_moves(moves: Iterable) -> bool:
        """ Returns True if given collection of moves contains no valid moves else False. """
        return not any(bool(move) for move in moves)

    def find_outcome(self) -> Tuple[bool, float]:
        """
        Returns outcome of the current game state.
        Boolean value defines if game reached terminal state.
        If game reached terminal state then integer values represent following cases:
        -1 - Black player won.
         0 - Draw.
         1 - White player won.
        """
        alive_pieces = set(self.positions.keys())
        if unit.BLACK_DEN not in alive_pieces or self.no_valid_moves(self.black_moves.values()):
            self.game_over = True
            self.outcome = 1
        elif unit.WHITE_DEN not in alive_pieces or self.no_valid_moves(self.white_moves.values()):
            self.game_over = True
            self.outcome = -1
        elif max(self.get_repetitions()) >= type(self).MAX_REPETITIONS:
            self.game_over = True
            self.outcome = 0
        else:
            self.outcome = self.value
        return self.game_over, self.outcome

    @classmethod
    def initialize(cls) -> Board:
        """ Initializes board according to game rules. """
        cells = [
            [Cell(unit.BLACK_LION), Cell(), Cell(trap=True, white_trap=False),
             Cell(unit.BLACK_DEN), Cell(trap=True, white_trap=False), Cell(),
             Cell(unit.BLACK_TIGER)],
            [Cell(), Cell(unit.BLACK_DOG), Cell(), Cell(trap=True, white_trap=False), Cell(),
             Cell(unit.BLACK_CAT), Cell()],
            [Cell(unit.BLACK_MOUSE), Cell(), Cell(unit.BLACK_LEOPARD), Cell(),
             Cell(unit.BLACK_WOLF), Cell(), Cell(unit.BLACK_ELEPHANT)],
            [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
             Cell(water=True), Cell()],
            [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
             Cell(water=True), Cell()],
            [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
             Cell(water=True), Cell()],
            [Cell(unit.WHITE_ELEPHANT), Cell(), Cell(unit.WHITE_WOLF), Cell(),
             Cell(unit.WHITE_LEOPARD), Cell(), Cell(unit.WHITE_MOUSE)],
            [Cell(), Cell(unit.WHITE_CAT), Cell(), Cell(trap=True, white_trap=True), Cell(),
             Cell(unit.WHITE_DOG), Cell()],
            [Cell(unit.WHITE_TIGER), Cell(), Cell(trap=True, white_trap=True),
             Cell(unit.WHITE_DEN), Cell(trap=True, white_trap=True), Cell(),
             Cell(unit.WHITE_LION)],
        ]
        new_board = Board(cells)
        new_board.model_white = ValuePolicyModel()
        new_board.model_black = AStarModel()
        return new_board

    def move(self, unit_position: Position, selected_move: unit_moves.Move, **kwargs) -> Board:
        """
        Executes move using move_board instance.

        :param unit_position: Current unit position, tuple (x_position, y_position).
        :param selected_move: Position to move unit to, tuple (x_position, y_position).

        :return: New instance of the board with unit moved to new position.

        board = [
            [Cell(Unit1), Cell(Empty)],
            [Cell(Empty), Cell(Empty)]
        ]
        board.move(Position(y=0, x=0), Move(y=0, x=1))
        board = [
            [Cell(Empty), Cell(Unit1)],
            [Cell(Empty), Cell(Empty)]
        ]
        """
        board_move = BoardMove(self)
        new_board = board_move(unit_position=unit_position, selected_move=selected_move, **kwargs)
        _, new_board.outcome = new_board.find_outcome()
        return new_board

    def to_tensor(self) -> BoardTensor:
        """ Creates BoardTensor instance using current board instance. """
        return BoardTensor(self)

    def predict(self) -> Tuple[float, np.ndarray]:
        model, model_type = (self.model_white, "white") if self.white_move else (
            self.model_black, "black")

        if isinstance(model, AStarModel):
            self.value, policy = model.predict(self)
            return self.value, policy

        if not isinstance(model, AbstractModel):
            raise ValueError(f"Provided {model_type} model '{type(self.model_white)}' is not of "
                             f"type 'AbstractModel'.")

        mask = self.get_move_mask()
        tensor = self.to_tensor()
        self.value, policy = model.predict(tensor, mask)
        return self.value, policy

    def get_move_mask(self) -> np.ndarray:
        """
        Creates mask tensor which can be used to mask out invalid moves from a final move
        representation.

        :return: Array with 1's on position which are reachable via a valid move.
        """
        mask = np.zeros((9, 7, 8), dtype=bool)
        for unit, moves in self.moves.items():

            if unit.white != self.white_move:
                continue

            position = self.positions[unit]
            for move in moves:
                x = position.x + move.x
                y = position.y + move.y
                plane = move.value
                mask[y, x, plane] = True
        return mask

    @classmethod
    def load(cls, state: List[List[dict]]) -> Board:
        cells = BoardSerializer.deserialize_board(state)
        board = cls(cells)
        board.model_white = ValuePolicyModel()
        return board


class BoardTensor(np.ndarray):

    def __new__(cls, board: Board):
        """
        Stores Board State Data over the following planes,
        board tensor is always presented from the perspective of the current player.

        #0  Current player Traps
        #1  Current player Den
        #2  Current player Mouse
        #3  Current player Dog
        #4  Current player Wolf
        #5  Current player Leopard
        #6  Current player Tiger
        #7  Current player Lion
        #8  Current player Elephant
        #9  Current player repetitions
        #10 Enemy player Traps
        #11 Enemy player Den
        #12 Enemy player Mouse
        #13 Enemy player Dog
        #14 Enemy player Wolf
        #15 Enemy player Leopard
        #16 Enemy player Tiger
        #17 Enemy player Lion
        #18 Enemy player Elephant
        #19 Enemy player repetitions
        #20 Is white player
        #21 Total move counter
        """
        STEP_BOARDS = 22
        NO_STEPS = 1
        if not isinstance(board, Board):
            raise TypeError(f"Expected type 'Board' got {type(board)}.")

        obj = np.zeros(shape=(9, 7, STEP_BOARDS * NO_STEPS + 2)).view(cls)
        obj.current_board = board

        current_white = board.white_move
        obj[:, :, -1] = current_white
        obj[:, :, -2] = board.move_count

        current_board = board
        for step in range(NO_STEPS):
            start = step * STEP_BOARDS
            stop = (step + 1) * STEP_BOARDS
            if current_board is None:
                obj[:, :, start:stop] = obj.get_empty_step_tensor()
            else:
                obj[:, :, start:stop] = obj.get_step_tensor(current_board, current_white)
                current_board = current_board.previous_board
        obj.flags.writeable = False
        return obj

    @staticmethod
    def get_step_tensor(board: Board, current_white: bool) -> np.ndarray:
        """ Generates tensor out of provided board state. """
        unit_tensor = np.zeros((9, 7, 20), dtype=bool)
        white_offset, black_offset = (0, 10) if current_white else (10, 0)
        unit_tensor[:, :, black_offset] = BoardTensor.black_trap_array()
        unit_tensor[:, :, white_offset] = BoardTensor.white_trap_array()
        for animal, position in board.positions.items():
            idx = white_offset if animal.white else black_offset
            idx += animal.value
            unit_tensor[position[0], position[1], idx] = 1
        repetition_tensor = np.ones((9, 7, 2), dtype=int)
        player, opponent = board.get_repetitions()
        repetition_tensor[:, :, 0] *= player
        repetition_tensor[:, :, 1] *= opponent
        if current_white:
            return np.concatenate([unit_tensor, repetition_tensor], axis=2)
        return np.flip(
            np.concatenate([unit_tensor, repetition_tensor], axis=2),
            axis=1
        )

    @staticmethod
    def get_empty_step_tensor() -> np.ndarray:
        """ Creates empty tensor. """
        unit_tensor = np.zeros((9, 7, 20), dtype=bool)
        repetition_tensor = np.zeros((9, 7, 2), dtype=int)
        return np.concatenate([unit_tensor, repetition_tensor], axis=2)

    @staticmethod
    def black_trap_array() -> np.ndarray:
        """ Creates 2D array representing black player trap locations. """
        array = np.zeros((9, 7), dtype=bool)
        array[0, 2] = 1
        array[0, 4] = 1
        array[1, 3] = 1
        return array

    @staticmethod
    def white_trap_array() -> np.ndarray:
        """ Creates 2D array representing white player trap locations. """
        array = np.zeros((9, 7), dtype=bool)
        array[8, 2] = 1
        array[8, 4] = 1
        array[7, 3] = 1
        return array


class BoardMove:

    def __init__(self, board: Board):
        self.board = board

    def __call__(
            self,
            unit_position: Position,
            selected_move: unit_moves.Move,
            ignore_turn: bool = False
    ) -> Board:
        """
        Executes move for a selected unit by executing following steps.

        0. Calculate new position and select corresponding unit.
        1. Validates if selected move is valid.
        2. Copy current board state into a new board instance, and update trackers.
        3. Remove captured unit if there is any.
        4. Move unit to new position
        5. Update moved unit board data.
        6. Update moved unit neighbours data, units which could capture selected field.
        7. Update repetition trackers for the board.
        9. Check game outcome.

        :param unit_position: Initial position of unit that will be moved.
        :param selected_move: Move which will be executed by a unit.

        :return: New instance of board which was created by following move algorithm shown above.
        """
        new_position = self.board.get_new_position(unit_position, selected_move)
        selected_unit = self.board[unit_position].occupant

        self.validate_move(selected_unit=selected_unit, selected_move=selected_move)
        if not ignore_turn:
            self.validate_player_piece(selected_unit=selected_unit)

        new_board = self.copy_board(positions=(unit_position, new_position))

        if new_board[new_position]:
            self.remove_captured_unit(board=new_board, position=new_position)

        self.move_unit(board=new_board, start_position=unit_position, end_position=new_position)
        self.update_unit(board=new_board, unit=selected_unit, position=new_position)

        self.update_neighbours(board=new_board, position=new_position)
        self.update_neighbours(board=new_board, position=unit_position)
        self.update_repetitions(board=new_board, start_position=unit_position,
                                end_position=new_position)

        new_board.find_outcome()

        return new_board

    def validate_move(self, selected_unit: unit.Unit, selected_move: unit_moves.Move) -> None:
        """ Raises MoveNotPossibleError in case selected unit cannot execute selected move. """
        unit_moves = self.board.moves[selected_unit]
        if selected_move not in unit_moves:
            unit_moves_str = "\n".join(f"\t{unit_move}" for unit_move in unit_moves)
            unit_position = self.board.positions[selected_unit]

            raise MoveNotPossibleError(
                f"Selected move is not valid.\n"
                f"Selected {selected_move} for unit '{selected_unit}' at {unit_position} with moves:\n"
                f"{unit_moves_str}"
            )

    def validate_player_piece(self, selected_unit: unit.Unit) -> None:
        """ Raises MoveNotPossibleError in case selected unit cannot move during current turn. """
        if selected_unit.white != self.board.white_move:
            player, piece = ("white", "black") if self.board.white_move else ("black", "white")
            raise MoveNotPossibleError(f"Selected {piece} piece during {player} player's turn.")

    def copy_board(self, positions: Tuple[Position, ...]) -> Board:
        """
        Creates a copy of board attribute and copies fields that will be affected during moves.

        :param positions: Iterable of Position, each cell defined by position will be copied.

        :return: New instance of board with copied important fields of numpy array.
        """
        board = copy(self.board)

        for position in positions:
            board[position] = copy(board[position])

        board.positions = self.board.positions.copy()
        board.moves = self.board.moves.copy()
        board.last_moves = deepcopy(self.board.last_moves)

        board.white_move = not self.board.white_move
        board.move_count = self.board.move_count + 1
        board.previous_board = self.board
        board.model_white = self.board.model_white
        board.model_black = self.board.model_black
        return board

    @staticmethod
    def remove_captured_unit(board: Board, position: Position) -> None:
        """
        Removes all data associated to captured unit from board instance.

        :param board: Instance of the board from which data will be removed.
        :param position: Position used to identify removed unit.

        :return: None.
        """
        captured_unit = board[position].occupant
        board[position].occupant = unit.EMPTY

        del board.positions[captured_unit]
        del board.moves[captured_unit]

    @staticmethod
    def move_unit(board: Board, start_position: Position, end_position: Position) -> None:
        """
        Moves unit from start to end, and sets start to Empty state.

        :param board: Instance of the board which will be modified.
        :param start_position: Position form which unit will be moved.
        :param end_position: Position to which unit will be moved.

        :return: None.
        """
        moved_unit = board[start_position].occupant

        board[end_position].occupant = moved_unit
        board[start_position].occupant = unit.EMPTY

    @staticmethod
    def update_unit(board: Board, unit: unit.Unit, position: Position) -> None:
        """
        Updates unit data by setting assigning it new position and moves.

        :param board: Instance of the board which will be updated.
        :param unit: Unit for which board attributes will be updated.
        :param position: Position which will be used for updating board data.

        :return: None.
        """
        board.positions[unit] = position
        board.moves[unit] = board.get_single_unit_moves(position)

    @staticmethod
    def update_repetitions(board: Board, start_position: Position, end_position: Position) -> None:
        """
        Updates board repetitions trackers.

        :param board: Instance of the board which repetitions trackers will be updated.
        :param start_position: Position form which unit was moved.
        :param end_position: Position to which unit was moved.

        :return: None.
        """
        current_player_moves, next_player_moves = board.last_moves
        current_player_moves.popleft()
        current_player_moves.append((start_position, end_position))
        board.last_moves = [next_player_moves, current_player_moves]

    @staticmethod
    def get_neighbour_position(board: Board, position: Position,
                               move: unit_moves.Move) -> Position:
        """
        Selects neighbour by given move, including jump move possibility.

        :param board: Instance of the board to find neighbour based on.
        :param position: Initial position used to calculate new one by moving.
        :param move: Move used to find neighbour.

        :return: Position of the neighbour.
        """
        new_position = board.get_new_position(position, move)
        if not board.is_position_valid(new_position):
            raise ValueError("Position outside of the board.")

        neighbour_cell = board[new_position]

        if not neighbour_cell and neighbour_cell.water:
            move = unit_moves.get_jump_move(move)
            new_position = board.get_new_position(position, move)
            if not board.is_position_valid(new_position):
                raise ValueError("Position outside of the board.")
            neighbour_cell = board[new_position]

        if neighbour_cell:
            return new_position

        raise ValueError("Position is Empty.")

    @staticmethod
    def update_neighbours(board: Board, position: Position):
        """
        Updates move data for all neighbours.

        :param board: Instance of the board which data will be updated.
        :param position: Position for which neighbours will be updated.

        :return: None.
        """
        for move in unit_moves.base_moves:
            try:
                new_position = BoardMove.get_neighbour_position(board, position, move)
            except ValueError:
                continue
            neighbour = board[new_position].occupant
            neighbour_moves = board.get_single_unit_moves(new_position)
            board.moves[neighbour] = neighbour_moves


class BoardSerializer:
    MoveProbability = namedtuple("MoveProbability", ["start", "end", "value"])

    @staticmethod
    def _serialize_cell(cell: "Cell") -> dict:
        """
        Converts cell into a dictionary object.

        :param cell: Cell instance to be serialized.

        :return: Dictionary of the following format
            {
                unit: {value: int, white: bool, moves: list},
                trap: {value: bool, white: bool}
                water: bool
            }
        """
        return {
            "unit": {
                "white": cell.occupant.white,
                "value": cell.occupant.value,
                "moves": [],
            },
            "trap": {
                "white": cell.white_trap,
                "value": cell.trap,
            },
            "water": cell.water
        }

    @staticmethod
    def serialize_board(board: "Board") -> List[dict]:
        """
        Serializes board object into JSON format.

        :param board: Board instance which will be serialized.

        :return: List of lists of the same shape as board, with serialized representations of Cells.
        """
        serialized_policy = board.serializer.serialize_policy(board)

        cells = []
        for cell_id in range(board.shape[0] * board.shape[1]):
            x = cell_id % board.shape[1]
            y = cell_id // board.shape[1]
            position = Position(x=x, y=y)

            serialized_cell = BoardSerializer._serialize_cell(board[position])
            serialized_cell["id"] = y * board.shape[1] + x
            if (serialized_cell["unit"]["value"] > 1
                    and serialized_cell["unit"]["white"] is board.white_move):
                serialized_cell["unit"]["moves"] = [
                    BoardSerializer._position_to_id(board.get_new_position(position, move),
                                                    board.shape[1]) for move in
                    board.get_single_unit_moves(position)
                ]
            serialized_cell["probability"] = serialized_policy[cell_id]
            cells.append(serialized_cell)
        return cells

    @staticmethod
    def _position_to_id(position: Position, columns: int) -> int:
        """
        Converts position into an ID value.

        :param position: Position which will be converted into an ID.
        :param columns: Number of columns in the board.

        :return: Cell ID.
        """
        return position.x + position.y * columns

    @staticmethod
    def _deserialize_cell(serialized_cell: dict) -> Cell:
        """
        Given dictionary representing cell converts it back into a cell.

        :param serialized_cell: Dictionary containing data about current cell state.

        :return: Cell constructed using cell_state.
        """
        unit = get_unit(serialized_cell["unit"]["value"], serialized_cell["unit"]["white"])
        cell_data = {
            "occupant": unit,
            "water": serialized_cell["water"],
            "trap": serialized_cell["trap"]["value"],
            "white_trap": serialized_cell["trap"]["white"]
        }
        return Cell(**cell_data)

    @staticmethod
    def dump(board: Board) -> List[List[dict]]:
        return [
            [BoardSerializer._serialize_cell(board[y, x]) for x in range(board.shape[1])]
            for y in range(board.shape[0])
        ]

    @staticmethod
    def deserialize_board(state: List[List[dict]]) -> List[List[Cell]]:
        return [[BoardSerializer._deserialize_cell(cell) for cell in row] for row in state]

    @staticmethod
    def _serialize_node(node: "Node") -> MoveProbability:
        """
        Given node object converts it into a tuple where first element represents move origin
        cell ID, second move destination cell ID and third cell value.

        :param node: Instance of node object.

        :return: New instance of MoveProbability.
        """
        import logging
        logging.error(node.board)
        old_position = node.parent.board.positions[node.unit_move.unit]
        new_position = node.board.positions[node.unit_move.unit]
        start_id = BoardSerializer._position_to_id(old_position, node.board.shape[1])
        end_id = BoardSerializer._position_to_id(new_position, node.board.shape[1])
        return BoardSerializer.MoveProbability(start=start_id, end=end_id, value=node.q)

    @staticmethod
    def serialize_root(root: "Root") -> List[dict]:
        """
        Given MCTS root node generates MoveProbabilities of all direct child nodes.

        :param root: Instance of Root class associated with MCTS.

        :return: List of all MoveProbabilities generated directly form root.
        """
        move_probs = [
            {"value": 0.0} for _ in range(root.node.board.shape[0] * root.node.board.shape[1])
        ]

        for child_node in root.node.child_nodes:
            move_prob = BoardSerializer._serialize_node(child_node)
            move_probs[move_prob.start]["value"] += move_prob.value
            move_probs[move_prob.end][str(move_prob.start)] = move_prob.value

        return move_probs

    @staticmethod
    def serialize_policy(board: Board) -> List[dict]:
        """
        Given current board state list of policy values associated with each cell.

        :param board: Current board state.

        :return: List of all MoveProbabilities generated from current board state.
        """
        move_probs = [
            {"value": 0.0} for _ in range(board.shape[0] * board.shape[1])
        ]

        _, policy = board.predict()

        for unit, start_position in board.positions.items():
            if unit.white != board.white_move:
                continue

            for move in board.moves[unit]:
                end_position = board.get_new_position(start_position, move)
                policy_value = float(BoardSerializer.get_policy_value_for_unit_move(
                    end_position, move, policy))

                start_id = BoardSerializer._position_to_id(start_position, board.shape[1])
                end_id = BoardSerializer._position_to_id(end_position, board.shape[1])

                move_probs[start_id]["value"] += policy_value
                move_probs[end_id][str(start_id)] = policy_value

        return move_probs

    @staticmethod
    def get_policy_value_for_unit_move(
            end_position: Position,
            move: unit_moves.Move,
            policy: np.ndarray
    ) -> float:
        """
        Given unit position and its move extract policy value associated with that combination.
        """
        y, x = end_position
        z = move.value
        return policy[y, x, z]


if __name__ == '__main__':
    board = Board.initialize()
    tensor = board.to_tensor()
    print(tensor.shape)
