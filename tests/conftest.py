import numpy as np

from pytest import fixture

from src.game_engine.cell import Cell


@fixture
def cell_array():
    cells = np.empty((17, 17), dtype=object)
    for row_id in range(cells.shape[0]):
        for column_id in range(cells.shape[1]):
            cells[row_id, column_id] = Cell(0, False, False)
    return cells
