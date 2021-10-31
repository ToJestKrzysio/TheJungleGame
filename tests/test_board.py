import pytest
import numpy as np

from src.game_engine.board import Board


# @pytest.mark.parametrize("shape", [(7, 9), (19, 19)])
# def test_board_state_new(shape: tuple):
#     board_1 = np.arange(shape[0] * shape[1]).reshape(shape)
#     board_2 = np.arange(42, 42 + shape[0] * shape[1]).reshape(shape)
#     board_3 = np.arange(893, 893 + shape[0] * shape[1]).reshape(shape)
#
#     board_state = BoardState(board_1, board_2, board_3)
#
#     assert isinstance(board_state, BoardState)
#     assert board_state.shape == (3, *shape)
#     assert np.array_equal(board_state[0], board_1)
#     assert np.array_equal(board_state[1], board_2)
#     assert np.array_equal(board_state[2], board_3)
from src.game_engine.unit import Unit, Empty


class TestBoard:

    def test_new(self, empty_cells_array):
        board = Board(empty_cells_array)

        assert isinstance(board, Board)
        assert board.shape == empty_cells_array.shape
        assert np.array_equal(board, empty_cells_array)
        assert not board.positions

    @pytest.mark.parametrize("position", [(9, 7), (2, 3), (0, 0)])
    @pytest.mark.parametrize("unit", [
        unit(white) for unit in Unit.__subclasses__()
        for white in (True, False) if not issubclass(unit, Empty)
    ])
    def test_get_positions(self, empty_cells_array, position, unit):
        empty_cells_array[position].occupant = unit
        board = Board(empty_cells_array)

        positions = board.get_positions()

        assert len(positions) == 1
        assert positions[unit] == position

    # @pytest.mark.parametrize("position, value, moves", [
    #     ((0, 0), (0, 1), (1, 0))
    # ])
    # def test_get_units_moves(self, position, moves, cell_array):
    #     pass

"""
2 1 8 0 0
0 0 0 0 0
0 W W 0 0 
0 0 0 0 0
0,0 0 0 0 0
"""

