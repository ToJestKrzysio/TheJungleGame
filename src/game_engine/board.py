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

        @staticmethod
        def get_repetition(moves: list) -> int:
            counter = Counter(moves)
            del counter[None]
            return counter[0]

            @staticmethod
            def get_repetitions(moves: list):




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
        raise MoveNotPossibleError("Selected move is not valid")

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
        obj = np.zeros(shape=(176, 9, 7)).view(cls)
        obj.current_board = board
        return obj

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

    def __array_finalize__(self, obj):
        STEP_BOARDS = 22
        current_board = obj.current_board
        for step in range(8):
            start = step * STEP_BOARDS
            stop = (step+1) * STEP_BOARDS
            player_moves, opponent_moves = current_board.last_moves
            Counter(player_moves)

            current_board = current_board.previous_board

    @staticmethod
    def get_step_tensor(board: Board):
        unit_tensor = np.zeros((20, 9, 7), dtype=bool)
        unit_tensor[0, :, :] = BoardTensor.black_trap_array()
        unit_tensor[10, :, :] = BoardTensor.white_trap_array()
        for animal, position in board.positions.items():
            idx = animal.value
            if animal.white:
                idx += 10
            unit_tensor[idx, position[0], position[1]] = 1
        repetition_tensor = np.zeros((20, 9, 7), dtype=bool)
        return unit_tensor
