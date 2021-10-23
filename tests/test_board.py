import pytest
import numpy as np

from src.game_engine.board import BoardState, Board
from src.game_engine.cell import Cell


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


@pytest.mark.parametrize("shape", [(7, 9), (19, 19)])
def test_board_new(shape):
    cells = np.empty(shape, dtype=object)
    for row_id in range(cells.shape[0]):
        for column_id in range(cells.shape[1]):
            cells[row_id, column_id] = Cell(0, False, False)

    board = Board(cells)
    assert isinstance(board, Board)
    assert board.shape == shape
    assert np.array_equal(board, cells)
