import copy

import numpy as np

from src.game_engine.cell import Cell
from src.game_engine.exceptions import MoveNotPossibleError
from src.game_engine.unit import *


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


def move(board_state, unit_position, new_position):
    """ Creates new instance of a board and moves animal to new location. """

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
    new_board.positions[moved_unit] = new_position
    new_board.moves[moved_unit] = new_board.get_single_unit_moves(
        new_position)

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


# board_1 = Board(initialize_board())
# board_2 = move(board_1, (0, 0), (0, 1))
# breakpoint()
