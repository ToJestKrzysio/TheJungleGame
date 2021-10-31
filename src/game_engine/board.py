import numpy as np

from src.game_engine.cell import Cell
from src.game_engine.exceptions import MoveNotPossibleError
from src.game_engine.unit import Empty, Unit
from src.game_engine.unit import Mouse, Cat, Dog, Wolf, Leopard, Tiger, Lion, \
    Elephant, Den


class Board(np.ndarray):

    def __new__(cls, cells: np.ndarray | list[list[Cell]]):
        obj = np.asarray(cells, dtype=Cell).view(cls)
        return obj

    def __array_finalize__(self, obj):
        """ Finalizes creation of new instance on Board. """
        if obj is None:
            return
        self.positions = self.get_positions()
        self.moves = self.get_moves_for_all_units()

    def get_positions(self) -> dict[Unit, tuple[int, int]]:
        """
        Generates dictionary of units on the board.

        :return: dict[unit_value] = tuple(row_id, column_id)
        """
        positions = dict()
        for row_id in range(self.shape[0]):
            for column_id in range(self.shape[1]):
                cell = self[row_id, column_id]
                if cell:
                    positions[cell.occupant] = (row_id, column_id)
        return positions

    def get_moves_for_all_units(self) -> dict[Unit, set[tuple[int, int]]]:
        """ Collects moves every unit can make into a dictionary. """
        return {unit: self.get_single_unit_moves(position)
                for unit, position in self.positions.items()}

    def get_single_unit_moves(
            self,
            position: tuple[int, int]
    ) -> set[tuple[int, int]]:
        """ Collects all_moves unit can make and returns only valid ones. """
        all_moves = [self.find_move_position(position, move)
                     for move in ((-1, 0), (1, 0), (0, -1), (0, 1))]
        return {tuple(move) for valid, *move in all_moves if valid}

    def is_position_valid(self, position: tuple[int, int]) -> bool:
        """ Checks if position is inside the board space. """
        y, x = position
        return y in range(self.shape[0]) and x in range(self.shape[1])

    @staticmethod
    def get_new_position_tuple(
            position: tuple[int, int],
            move: tuple[int, int],
    ) -> tuple[int, int]:
        """ Returns new position as a tuple. """
        y, x = position
        move_y, move_x = move
        return y + move_y, x + move_x

    def find_move_position(
            self,
            position: tuple[int, int],
            move: tuple[int, int]
    ) -> tuple[bool, int, int]:
        """ Checks if move in the given direction is valid. """
        INVALID_POSITION = (False, -1, -1)
        old_cell = self[position]
        new_position = self.get_new_position_tuple(position, move)

        if not self.is_position_valid(new_position):
            return INVALID_POSITION

        new_cell = self[new_position]
        if new_cell.water and old_cell.occupant.jumps:
            while new_cell.water and isinstance(new_cell.occupant, Empty):
                new_position = self.get_new_position_tuple(new_position, move)
                if not self.is_position_valid(new_position):
                    return INVALID_POSITION
                new_cell = self[new_position]

        if old_cell.can_capture(new_cell):
            return True, new_position[0], new_position[1]

        return INVALID_POSITION


def move(board_state, unit_position, new_position):
    """
    Creates new instance of a board and moves animal to new location.
    """

    if (new_position not in
            board_state.moves[board_state[unit_position].occupant]):
        raise MoveNotPossibleError("Selected move is not valid")

    new_board = Board(np.deepcopy(board_state))  # TODO maybe deep copy?
    moved_unit = new_board[unit_position].occupant
    captured_unit = new_board[new_position]

    if new_board[new_position]:
        del new_board.poitions[captured_unit]
        del new_board.moves[captured_unit]

    new_board[new_position].occupant = moved_unit
    new_board[unit_position].occupant = Empty()
    new_board.positions[moved_unit] = new_position
    new_board.moves[moved_unit] = new_board.get_single_unit_moves(
        new_position)

    return new_board


# class BoardRepresentation(np.ndarray):
#
#     def __new__(cls, board: Board):
#         return np.zeros_like(board)
#
#     # def get_pawn_positions(self):


# class BoardState(np.ndarray):
#     """ TODO - may be obsolete """
#     """ Class used for representation of current BoardState. """
#
#     def __new__(cls, pawns, fields, player):
#         """ Create new instance of BoardState. """
#         pawns = np.asarray(pawns, dtype=int)
#         fields = np.asarray(fields, dtype=int)
#         player = np.asarray(player, dtype=int)
#         obj = np.stack((pawns, fields, player), axis=0).view(cls)
#         return obj


def initialize_board():
    # TODO update
    board = Board([
        [Cell(Lion(False)), Cell(), Cell(trap=True, white_trap=False),
         Cell(Den(False)), Cell(trap=True, white_trap=False), Cell(),
         Cell(Tiger(False))],
        [Cell(), Cell(Dog(False)), Cell(), Cell(trap=True, white_trap=False),
         Cell(), Cell(Cat(False)), Cell()],
        [Cell(Mouse(False)), Cell(), Cell(Leopard(False)), Cell(),
         Cell(Wolf(False)), Cell(), Cell(Elephant(False))],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(Elephant(True)), Cell(), Cell(Wolf(True)), Cell(),
         Cell(Leopard(True)), Cell(), Cell(Mouse(True))],
        [Cell(), Cell(Cat(True)), Cell(), Cell(trap=True, white_trap=True),
         Cell(), Cell(Dog(True)), Cell()],
        [Cell(Tiger(True)), Cell(), Cell(trap=True, white_trap=True),
         Cell(Den(True)), Cell(trap=True, white_trap=True), Cell(),
         Cell(Lion(True))],
    ])
    return board


board = initialize_board()
new_board = move(board, (0, 0), (0, 1))
breakpoint()
