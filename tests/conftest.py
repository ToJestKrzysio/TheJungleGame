import numpy as np

from pytest import fixture

from src.game_engine.cell import Cell
from src.game_engine.unit import Empty


@fixture
def empty_cells_array():
    cells = np.empty((17, 17), dtype=object)
    for row_id in range(cells.shape[0]):
        for column_id in range(cells.shape[1]):
            cells[row_id, column_id] = Cell(Empty(), False, False)
    return cells
