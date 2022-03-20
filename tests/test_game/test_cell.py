from unittest.mock import Mock, patch, PropertyMock

import pytest

from src.game import Cell, EMPTY, GroundStates, JumpIntoWaterError, Unit


class TestCell:

    ENTERS_WATER = [child(white) for child in Unit.__subclasses__()
                    for white in (True, False)]
    SWIMMER_EXAMPLES = [pet for pet in ENTERS_WATER if pet.swims]
    NON_SWIMMER_EXAMPLES = [pet for pet in ENTERS_WATER if not pet.swims]

    @pytest.mark.parametrize("water, trap, result", [
        (False, False, (True, False, False, GroundStates.LAND.value)),
        (True, False, (False, True, False, GroundStates.WATER.value)),
        (False, True, (True, False, True, GroundStates.TRAP.value)),
    ])
    def test_init_ground(self, water, trap, result):
        assert Cell.init_ground(water, trap) == result

    @pytest.mark.parametrize("water, trap", [
        (True, False), (False, True), (False, False)
    ])
    @pytest.mark.parametrize("occupant", NON_SWIMMER_EXAMPLES)
    @patch("src.game.cell.Cell.occupant", new_callable=PropertyMock)
    def test_init_land(self, occupant_spy, occupant, water, trap):
        cell = Cell(occupant, water=water, trap=trap)

        occupant_spy.assert_called_once_with(occupant)
        assert cell.water == water
        assert cell.land != water
        assert cell.trap == trap

    @pytest.mark.parametrize("occupant", NON_SWIMMER_EXAMPLES)
    def test_occupant_jump_into_water_error(self, occupant):
        with pytest.raises(JumpIntoWaterError):
            Cell(occupant, water=True, trap=False)

    @pytest.mark.parametrize("occupant", SWIMMER_EXAMPLES)
    def test_occupant_water(self, occupant):
        cell = Cell(EMPTY, water=True, trap=False)

        cell.occupant = occupant
        assert cell.occupant == occupant
        assert cell.occupied == bool(occupant)

    @pytest.mark.parametrize("occupant", NON_SWIMMER_EXAMPLES)
    def test_occupant_land(self, occupant):
        cell = Cell(EMPTY, water=False, trap=False)

        cell.occupant = occupant
        assert cell.occupant == occupant
        assert cell.occupied == bool(occupant)

    @pytest.mark.parametrize("occupant_value", range(-9, 10))
    @pytest.mark.parametrize("ground", range(0, 4))
    def test_get_cell_state(self, occupant_value, ground):
        cell_mock = Mock(spec=Cell)
        cell_mock.occupant = Mock(value=occupant_value)
        cell_mock.ground_value = ground

        assert Cell.get_cell_state(self=cell_mock) == (occupant_value, ground)

    # def test_can_capture_mouse_captures_elephant(self):
    # def test_can_capture_elephant_captures_mouse(self):
    # def test_can_capture_mouse_water_to_water(self):
    # def test_can_capture_mouse_water_to_land(self):
    # def test_can_capture_mouse_land_to_water(self):
    # def test_can_capture_attack_trapped_animal(self):
    # def test_can_capture_swimming_mouse(self):
