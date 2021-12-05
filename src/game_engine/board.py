from __future__ import annotations

import copy
from collections import Counter

import numpy as np

from src.game_engine.cell import Cell
from src.game_engine.exceptions import MoveNotPossibleError
from src.game_engine.unit import *

MAX_REPETITIONS = 3


class Board(np.ndarray):
    """
    Class representing current board state.

    positions: dictionary {Unit instance: tuple representing current position}.
    moves: dictionary {Unit instance: set of tuples of valid moves}.
    previous_board: reference to previous board instance, if previous board
        does not exist equals None.
    last_moves: List
    """
    positions: dict[Unit, tuple[int, int]]
    moves: dict[Unit, set[tuple[int, int]]]
    previous_board: Board | None
    last_moves: list[list, list]
    move_count: int
    white_move: bool

    def __new__(cls, cells: np.ndarray | list[list[Cell]]):
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
            [None] * (MAX_REPETITIONS - 1),
            [None] * (MAX_REPETITIONS - 1),
        ]
        self.white_move = True
        self.move_count = 0
        
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
        all_moves = [self._find_move_position(position, move)
                     for move in ((-1, 0), (1, 0), (0, -1), (0, 1))]
        return {tuple(move) for valid, *move in all_moves if valid}

    def _is_position_valid(self, position: tuple[int, int]) -> bool:
        """ Checks if position is inside the board space. """
        y, x = position
        return y in range(self.shape[0]) and x in range(self.shape[1])

    @staticmethod
    def _get_new_position_tuple(
            position: tuple[int, int],
            move: tuple[int, int],
    ) -> tuple[int, int]:
        """ Returns new position as a tuple. """
        y, x = position
        move_y, move_x = move
        return y + move_y, x + move_x

    def _get_land_position_across_the_water(
            self,
            new_position: tuple[int, int],
            move: tuple[int, int]
    ) -> tuple[bool, int, int]:
        """ Moves across the water and returns the position across it. """
        new_cell = self[new_position]
        while new_cell.water:
            if new_cell.occupant is not EMPTY:
                return False, -1, -1

            new_position = self._get_new_position_tuple(new_position, move)
            if not self._is_position_valid(new_position):
                return False, -1, -1
            new_cell = self[new_position]
        return True, new_position[0], new_position[1]

    def _find_move_position(
            self,
            position: tuple[int, int],
            move: tuple[int, int]
    ) -> tuple[bool, int, int]:
        """ Checks if move in the given direction is valid. """
        INVALID_POSITION = (False, -1, -1)
        old_cell = self[position]
        new_position = self._get_new_position_tuple(position, move)

        if not self._is_position_valid(new_position):
            return INVALID_POSITION

        new_cell = self[new_position]
        if new_cell.water and old_cell.occupant.jumps:
            valid, *new_position = (
                self._get_land_position_across_the_water(new_position, move)
            )
            if not valid:
                return INVALID_POSITION
            new_cell = self[new_position]

        if old_cell.can_capture(new_cell):
            return True, new_position[0], new_position[1]

        return INVALID_POSITION

    def get_repetitions(self) -> tuple[int, int]:
        """ Get number of repetitions for player and the opponent. """
        player, opponent = self.last_moves
        return self._get_repetition(player), self._get_repetition(opponent)

    @staticmethod
    def _get_repetition(moves: list) -> int:
        """
        Calculates maximum number of repetitions within the given list of
        moves.
        """
        counter = Counter(moves)
        del counter[None]
        most_common = counter.most_common(1)
        return most_common[0][1] if most_common else 0


def move(
        board_state: Board,
        unit_position: tuple[int, int],
        new_position: tuple[int, int]
) -> Board:
    """
    Creates new instance of a board and moves selected unit to new location
    on that board.
    """

    if (new_position not in
            board_state.moves[board_state[unit_position].occupant]):
        raise MoveNotPossibleError("Selected move is not valid.")
    if board_state[unit_position].occupant.white is not board_state.white_move:
        raise MoveNotPossibleError(
            "Wrong piece selected, it's {} player turn.".format(
                "white" if board_state.white_move else "black"
            )
        )

    new_board = copy.copy(board_state)
    new_board[unit_position] = copy.copy(new_board[unit_position])
    new_board[new_position] = copy.copy(new_board[new_position])
    moved_unit = new_board[unit_position].occupant
    captured_unit = new_board[new_position].occupant

    if new_board[new_position]:
        del new_board.positions[captured_unit]
        del new_board.moves[captured_unit]

    new_board[new_position].occupant = moved_unit
    new_board[unit_position].occupant = EMPTY

    new_board.positions = board_state.positions.copy()
    new_board.positions[moved_unit] = new_position

    new_board.moves = board_state.moves.copy()
    new_board.moves[moved_unit] = new_board.get_single_unit_moves(
        new_position)

    current_player_moves, next_player_moves = board_state.last_moves.copy()
    current_player_moves.pop(0)
    current_player_moves.append((unit_position, new_position))
    new_board.last_moves = [next_player_moves, current_player_moves]
        
    new_board.white_move = not board_state.white_move
    new_board.move_count = board_state.move_count + 1
    new_board.previous_board = board_state

    return new_board


def initialize_board():
    board = [
        [Cell(BLACK_LION), Cell(), Cell(trap=True, white_trap=False),
         Cell(BLACK_DEN), Cell(trap=True, white_trap=False), Cell(),
         Cell(BLACK_LEOPARD)],
        [Cell(), Cell(BLACK_DOG), Cell(), Cell(trap=True, white_trap=False),
         Cell(), Cell(BLACK_CAT), Cell()],
        [Cell(BLACK_MOUSE), Cell(), Cell(BLACK_LEOPARD), Cell(),
         Cell(BLACK_WOLF), Cell(), Cell(BLACK_ELEPHANT)],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(), Cell(water=True), Cell(water=True), Cell(), Cell(water=True),
         Cell(water=True), Cell()],
        [Cell(WHITE_ELEPHANT), Cell(), Cell(WHITE_WOLF), Cell(),
         Cell(WHITE_LEOPARD), Cell(), Cell(WHITE_MOUSE)],
        [Cell(), Cell(WHITE_CAT), Cell(), Cell(trap=True, white_trap=True),
         Cell(), Cell(WHITE_DOG), Cell()],
        [Cell(WHITE_TIGER), Cell(), Cell(trap=True, white_trap=True),
         Cell(WHITE_DEN), Cell(trap=True, white_trap=True), Cell(),
         Cell(WHITE_LION)],
    ]
    return board


class BoardTensor(np.ndarray):

    def __new__(cls, board: Board):
        if not isinstance(board, Board):
            raise TypeError(f"Expected type 'Board' got {type(board)}.")
        obj = np.zeros(shape=(175, 9, 7))

        obj[-1, :, :] = board.white_move
        obj[-2, :, :] = board.move_count

        STEP_BOARDS = 22
        current_board = board
        for step in range(8):
            start = step * STEP_BOARDS
            stop = (step + 1) * STEP_BOARDS
            if current_board is None:
                break
            obj[start:stop, :, :] = BoardTensor.get_step_tensor(
                current_board, board.white_move)
            current_board = current_board.previous_board
        return obj

    def __array_finalize__(self, obj):
        if obj is None:
            return
        STEP_BOARDS = 22
        current_board = obj.current_board
        current_white = current_board.white_move
        for step in range(8):
            start = step * STEP_BOARDS
            stop = (step + 1) * STEP_BOARDS
            if self.current_board is None:
                self[start:stop, :, :] = self.get_empty_step_tensor()
            else:
                self[start:stop, :, :] = self.get_step_tensor(current_board,
                                                              current_white)
            current_board = current_board.previous_board
        current_board[-1, :, :] = current_white
        current_board[-2, :, :] = obj.current_board.move_count
        
    @staticmethod
    def get_step_tensor(board: Board, current_white: bool):
        unit_tensor = np.zeros((20, 9, 7), dtype=bool)
        white_offset, black_offset = (0, 10) if current_white else (10, 0)
        unit_tensor[black_offset, :, :] = BoardTensor.black_trap_array()
        unit_tensor[white_offset, :, :] = BoardTensor.white_trap_array()
        for animal, position in board.positions.items():
            idx = white_offset if animal.white else black_offset
            idx += animal.value
            unit_tensor[idx, position[0], position[1]] = 1
        repetition_tensor = np.ones((2, 9, 7), dtype=int)
        player, opponent = board.get_repetitions()
        repetition_tensor[0, :, :] *= player
        repetition_tensor[1, :, :] *= opponent
        if current_white:
            return np.concatenate([unit_tensor, repetition_tensor], axis=0)
        return np.flip(
            np.concatenate([unit_tensor, repetition_tensor], axis=0),
            axis=1
        )

    @staticmethod
    def get_empty_step_tensor():
        unit_tensor = np.zeros((20, 9, 7), dtype=bool)
        repetition_tensor = np.zeros((2, 9, 7), dtype=int)
        return np.concatenate([unit_tensor, repetition_tensor], axis=0)

    @staticmethod
    def black_trap_array():
        array = np.zeros((9, 7), dtype=bool)
        array[0, 2] = 1
        array[0, 4] = 1
        array[1, 3] = 1
        return array

    @staticmethod
    def white_trap_array():
        array = np.zeros((9, 7), dtype=bool)
        array[8, 2] = 1
        array[8, 4] = 1
        array[7, 3] = 1
        return array
