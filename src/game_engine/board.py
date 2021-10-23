import numpy as np


class Board(np.ndarray):

    def __new__(cls, cells):
        return np.asarray(cells, dtype=object).view(cls)


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
