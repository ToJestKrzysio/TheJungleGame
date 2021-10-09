import numpy as np
from dataclasses import dataclass


@dataclass
class Config:
    shape = (7, 9)


class Board:
    shape = (7, 9)

    def __init__(self):
        self.state = vectorize_cells(self.new_game())

    @staticmethod
    def new_game(simplified: bool = False) -> np.ndarray:
        if simplified:
            return np.array([
                [+8, 00, +9, +10, +9, 00, +5],
                [00, +3, 00,  +9, 00, +1, 00],
                [+1, 00, +5,  00, +3, 00, +8],
                [00, 00, 00,  00, 00, 00, 00],
                [00, 00, 00,  00, 00, 00, 00],
                [00, 00, 00,  00, 00, 00, 00],
                [-8, 00, -3,  00, -5, 00, -1],
                [00, -1, 00,  -9, 00, -3, 00],
                [-5, 00, -9, -10, -9, 00, -8],
            ], dtype=int)
        else:
            return np.array([
                [+7, 00, +9, +10, +9, 00, +6],
                [00, +3, 00,  +9, 00, +2, 00],
                [+1, 00, +5,  00, +4, 00, +8],
                [00, 11, 11,  00, 11, 11, 00],
                [00, 11, 11,  00, 11, 11, 00],
                [00, 11, 11,  00, 11, 11, 00],
                [-8, 00, -4,  00, -5, 00, -1],
                [00, -2, 00,  -9, 00, -3, 00],
                [-6, 00, -9, -10, -9, 00, -7],
            ], dtype=int)


def vectorize_cell(element) -> np.ndarray:
    empty = np.zeros(22, dtype=bool)
    empty[element+10] = True
    return empty


def vectorize_cells(array: np.ndarray) -> np.ndarray:
    return np.array([[vectorize_cell(cell) for cell in row] for row in array])


b = Board()
t = 1
