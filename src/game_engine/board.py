import numpy as np

from src.game_engine.properties import jumps_over_water, enters_water, no_water_interaction


class Board(np.ndarray):

    def __new__(cls, cells: np.ndarray | list[list]):
        obj = np.asarray(cells, dtype=object).view(cls)
        return obj

    def __array_finalize__(self, obj):
        if obj is None:
            return
        self.positions = self.get_positions()
        # self.moves = self.get_unit_moves()

    def get_positions(self) -> dict:
        positions = dict()
        for row_id in range(self.shape[0]):
            for column_id in range(self.shape[1]):
                cell = self[row_id, column_id]
                if cell:
                    positions[cell.occupant] = (row_id, column_id)
        return positions

    def get_unit_moves(self, position):
        moves = []
        for move in ((-1, 0), (1, 0), (0, -1), (0, 1)):
            valid_move, new_y, new_x = self.find_move_position(position, move)
            if not valid_move:

    def is_position_valid(self, y: int, x: int) -> bool:
        return y in range(self.shape[0]) and x in range(self.shape[1])

    @staticmethod
    def get_new_position_tuple(y, x, move_y, move_x) -> tuple:
        return y + move_y, x + move_x

    def find_move_position(self, position, move) -> tuple[bool, int, int]:
        old_cell = self[position]
        new_position = type(self).get_new_position_tuple(position, move)

        if not self.is_position_valid(new_position):
            return False, 0, 0
        new_cell = self[new_position]

        if new_cell.water:
            if old_cell.occupant in enters_water and new_cell.can_be_captured(old_cell):


            if occupant in jumps_over_water:
                while self[new_position].water:
                    new_position = type(self).get_new_position_tuple(new_position, move)
                    if not self.is_position_valid(new_position):
                        return False, 0, 0

        while self[new_position].water:
            if occupant in jumps_over_water:

            elif occupant in enters_water:
                pass

    def position_may_be_captured(self, new_position, position):
        attacker = self[position].occupant
        defender = self[new_position].occupant

        if not defender:
            return True

        if attacker * defender > 0:
            return False

        if

        if attacker * attacker >= defender * defender:
            return True




# class BoardRepresentation(np.ndarray):
#
#     def __new__(cls, board: Board):
#         return np.zeros_like(board)
#
#     # def get_pawn_positions(self):


class BoardState(np.ndarray):
    """ TODO - may be obsolete """
    """ Class used for representation of current BoardState"""

    def __new__(cls, pawns, fields, player):
        """ Create new instance of BoardState. """
        pawns = np.asarray(pawns, dtype=int)
        fields = np.asarray(fields, dtype=int)
        player = np.asarray(player, dtype=int)
        obj = np.stack((pawns, fields, player), axis=0).view(cls)
        return obj


def initialize_board():
    player = np.ones((9, 7), dtype=int)
    fields = np.array([
        [0, 0, 2, 0, 2, 0, 0],
        [0, 0, 0, 2, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 1, 1, 0, 1, 1, 0],
        [0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 2, 0, 0, 0],
        [0, 0, 2, 0, 2, 0, 0],
    ])
    pawns = np.array([
        [-7, 00, 00, -9, 00, 00, -6],
        [00, -3, 00, 00, 00, -2, 00],
        [-1, 00, -5, 00, -4, 00, -8],
        [00, 00, 00, 00, 00, 00, 00],
        [00, 00, 00, 00, 00, 00, 00],
        [00, 00, 00, 00, 00, 00, 00],
        [+8, 00, +4, 00, +5, 00, +1],
        [00, +2, 00, 00, 00, +3, 00],
        [+6, 00, 00, +9, 00, 00, +7],
    ])
    board_state = BoardState(pawns, fields, player)
    return board_state
