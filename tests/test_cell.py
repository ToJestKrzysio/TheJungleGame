import pytest

from src.game_engine.cell import Cell


class TestCell:

    @pytest.mark.parametrize("water, trap, result", [
        (False, False, (True, False, False, 1)),
        (True, False, (False, True, False, 2)),
        (False, True, (True, False, True, 3)),
    ])
    def test__init_ground(self, water, trap, result):
        assert Cell.init_ground(False, False) == result

    def test__init(self):
        pass

    def test__get_cell_state(self):
        pass
