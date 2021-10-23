from unittest.mock import Mock, patch, PropertyMock

import pytest

from src.game_engine.cell import Cell
from src.game_engine.exceptions import JumpIntoWaterError
from src.game_engine.properties import water_types, GroundStates

water_examples = [value * sign for value in water_types for sign in (-1, 1)]
non_water_examples = [value * sign for value in set(range(0, 9)).difference(water_types) for sign in (-1, 1)]


class TestCell:

    @pytest.mark.parametrize("water, trap, result", [
        (False, False, (True, False, False, GroundStates.LAND.value)),
        (True, False, (False, True, False, GroundStates.WATER.value)),
        (False, True, (True, False, True, GroundStates.TRAP.value)),
    ])
    def test_init_ground(self, water, trap, result):
        assert Cell.init_ground(water, trap) == result

    @pytest.mark.parametrize("water, trap", [(True, False), (False, True), (False, False)])
    @pytest.mark.parametrize("occupant", non_water_examples)
    @patch("src.game_engine.cell.Cell.occupant", new_callable=PropertyMock)
    def test_init_land(self, occupant_spy, occupant, water, trap):
        cell = Cell(occupant, water=water, trap=trap)

        occupant_spy.assert_called_once_with(occupant)
        assert cell.water == water
        assert cell.land != water
        assert cell.trap == trap

    @pytest.mark.parametrize("occupant", non_water_examples)
    def test_occupant_jump_into_water_error(self, occupant):
        with pytest.raises(JumpIntoWaterError):
            Cell(occupant, water=True, trap=False)

    @pytest.mark.parametrize("occupant", water_examples)
    def test_occupant_water(self, occupant):
        cell = Cell(0, water=True, trap=False)

        cell.occupant = occupant
        assert cell.occupant == occupant
        assert cell.occupied == bool(occupant)

    @pytest.mark.parametrize("occupant", non_water_examples)
    def test_occupant_land(self, occupant):
        cell = Cell(0, water=False, trap=False)

        cell.occupant = occupant
        assert cell.occupant == occupant
        assert cell.occupied == bool(occupant)

    @pytest.mark.parametrize("occupant", range(-9, 10))
    @pytest.mark.parametrize("ground", range(0, 4))
    def test_get_cell_state(self, occupant, ground):
        cell_mock = Mock(spec=Cell)
        cell_mock.occupant = occupant
        cell_mock.ground_value = ground

        assert Cell.get_cell_state(self=cell_mock) == (occupant, ground)

    @pytest.mark.parametrize("occupant", range(-9, 10))
    @pytest.mark.parametrize("water, trap", [(True, False), (False, True), (False, False)])
    @patch("src.game_engine.cell.Cell.occupant", new_callable=PropertyMock)
    def test_repr(self, occupant_patch, occupant: int, water: bool, trap: bool):
        occupant_patch.return_value = occupant
        cell = Cell(occupant, water, trap)

        assert repr(cell) == f"Cell(occupant={occupant}, water={water}, trap={trap})"

    def test_bool(self):
        assert not Cell(0, False, False)
        assert Cell(1, False, False)

