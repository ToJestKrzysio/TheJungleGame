import numpy as np


class Board(np.ndarray):

    def __new__(cls, cells: np.ndarray | list[list]):
        obj = np.asarray(cells, dtype=object).view(cls)
        obj.positions = cls.get_unit_locations(obj)
        return obj

    def __array_finalize__(self, obj):
        if obj is None:
            return
        self.positions = getattr(obj, 'positions', None)

    @staticmethod
    def get_unit_locations(board: np.ndarray) -> dict:
        locations = dict()
        for row_id in range(board.shape[0]):
            for column_id in range(board.shape[1]):
                cell = board[row_id, column_id]
                if cell:
                    locations[cell.occupant] = (row_id, column_id)
        return locations


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
