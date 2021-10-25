import pytest
import numpy as np

from src.game_engine.board import BoardState, Board


@pytest.mark.parametrize("shape", [(7, 9), (19, 19)])
def test_board_state_new(shape: tuple):
    board_1 = np.arange(shape[0] * shape[1]).reshape(shape)
    board_2 = np.arange(42, 42 + shape[0] * shape[1]).reshape(shape)
    board_3 = np.arange(893, 893 + shape[0] * shape[1]).reshape(shape)

    board_state = BoardState(board_1, board_2, board_3)

    assert isinstance(board_state, BoardState)
    assert board_state.shape == (3, *shape)
    assert np.array_equal(board_state[0], board_1)
    assert np.array_equal(board_state[1], board_2)
    assert np.array_equal(board_state[2], board_3)


class TestBoard:

    def test_new(self, cell_array):
        board = Board(cell_array)

        assert isinstance(board, Board)
        assert board.shape == cell_array.shape
        assert np.array_equal(board, cell_array)
        assert not board.positions

    @pytest.mark.parametrize("position", [(1, 1), (2, 3), (6, 9)])
    def test_get_positions(self, position, cell_array):
        cell_array[position].occupant = 4
        board = Board(cell_array)

        positions = board.get_positions()

        assert len(positions) == 1
        assert positions[4] == position

    @pytest.mark.parametrize("position, value, moves", [
        ((0, 0), {(0, 1), (1, 0)})
    ])
    def test_get_units_moves(self, position, moves, cell_array):
        pass

"""
2 1 8 0 0
0 0 0 0 0
0 W W 0 0 
0 0 0 0 0
0 0 0 0 0
"""

