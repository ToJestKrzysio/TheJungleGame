import numpy as np

from unit import Unit


class Board:
    state: np.ndarray
    size = (9, 7)

    def __init__(self):
        self.white_units = type(self).create_units(white=True)
        (self.white_mouse, self.white_cat, self.white_dog, self.white_wolf, self.white_leopard,
            self.white_tiger, self.white_lion, self.white_elephant, self.white_den) = self.white_units

        self.black_units = type(self).create_units(white=False)
        (self.black_mouse, self.black_cat, self.black_dog, self.black_wolf, self.black_leopard,
            self.black_tiger, self.black_lion, self.black_elephant, self.black_den) = self.black_units

        self.units = np.array([
            [self.black_lion.move((0, 0)), 0, 0, self.black_den.move((0, 3)), 0, 0, self.black_tiger.move((0, 6))],
            [0, self.black_dog.move((1, 1)), 0, 0, 0, self.black_cat.move((1, 5)), 0],
            [self.black_mouse.move((2, 0)), 0, self.black_leopard.move((2, 2)), 0, self.black_wolf.move((2, 4)), 0,
                self.black_elephant.move((2, 6))],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [self.white_elephant.move((6, 0)), 0, self.white_wolf.move((6, 2)), 0, self.white_leopard.move((6, 4)), 0,
                self.white_mouse.move((6, 6))],
            [0, self.white_cat.move((7, 1)), 0, 0, 0, self.white_dog.move((7, 5)), 0],
            [self.white_tiger.move((8, 0)), 0, 0, self.white_den.move((8, 3)), 0, 0, self.white_lion.move((8, 6))],
        ], dtype=Unit)

        self.cells = np.array([
            [0,  0, 10,  0, 10,  0, 0],
            [0,  0,  0, 10,  0,  0, 0],
            [0,  0,  0,  0,  0,  0, 0],
            [0, 11, 11,  0, 11, 11, 0],
            [0, 11, 11,  0, 11, 11, 0],
            [0, 11, 11,  0, 11, 11, 0],
            [0,  0,  0,  0,  0,  0, 0],
            [0,  0,  0, 10,  0,  0, 0],
            [0,  0, 10,  0, 10,  0, 0],
        ])

        # TODO
        #  czy nie lepiej używać 2D arraya instancji cell która przechowuje info o tym jakie to jest pole i kto je
        #  aktualnie zajmuje?                       <- zamiast 2 arrayów

    def get_board_state(self):
        state = np.zeros((2, *self.size))
        state[0, :, :] = np.array([
            [type(self).get_unit_value(cell) for cell in row] for row in self.units
        ])
        state[1, :, :] = self.cells
        return state

    @staticmethod
    def get_unit_value(unit):
        return unit.value * (int(unit.white) * 2 - 1) if isinstance(unit, Unit) else 0

    @staticmethod
    def create_units(white: bool):
        return (
            Unit((0, 0), 1, white),
            Unit((0, 0), 2, white),
            Unit((0, 0), 3, white),
            Unit((0, 0), 4, white),
            Unit((0, 0), 5, white),
            Unit((0, 0), 6, white),
            Unit((0, 0), 7, white),
            Unit((0, 0), 8, white),
            Unit((0, 0), 9, white),
        )

    def show(self):
        board_state = self.get_board_state()
        state_logical_matrix = board_state[0, :, :] != 0
        representation = board_state[1]
        representation[state_logical_matrix] = board_state[0][state_logical_matrix]
        return representation

    def move(self, current_position: tuple[int, int], new_position: tuple[int, int]) -> None: # is it really None
        selected_unit = self.state[current_position]
        if new_position in selected_unit.moves:
            self.state[new_position] = selected_unit
            # selected_unit.get_moves()
            self.state[current_position] = 0


class BoardState:

    def __init__(self):
        pass


board = Board()
print(board.show())

