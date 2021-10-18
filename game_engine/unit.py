import numpy as np


from cell import Cell


class Unit:
    moves: set
    position: tuple
    value: int

    def __init__(self, position: tuple[int, int], value: int, white: bool):
        self.position = position
        self.value = value
        self.white = white
        self.color_value = int(white) * 2 - 1


    def get_moves(self, board_state: np.array) -> set:
        """
        Calculate possible next moves.

        :return: Set of possible next moves
        """
        pass

    def move(self, new_position):
        """
        Moves piece to new_position.

        :param new_position: Tuple (x_position, y_position).

        :return: np.array representation of new board state.
        """
        return self

