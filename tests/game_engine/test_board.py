from unittest.mock import Mock, call, MagicMock

import pytest
import numpy as np

from src.game_engine.board import Board
from src.game_engine.unit import Unit, Empty, Mouse, Tiger, Dog, EMPTY
from src.game_engine.unit import *



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

    @pytest.mark.parametrize("positions", [
        {"Lion": (0, 0), "Dog": (1, 1), "Mouse": (2, 0)},
        {"Den": (0, 3), "Dog": (1, 6)},
        dict(),
    ])
    def test_get_moves_for_all_units(self, positions):
        board_mock = Mock(positions=positions)
        board_mock.get_single_unit_moves.return_value = {
            (0, 0), (1, 1), (2, 2), (3, 3)
        }

        result = Board.get_moves_for_all_units(board_mock)

        expected_calls = [call(position) for position in positions.values()]
        board_mock.get_single_unit_moves.assert_has_calls(expected_calls)
        assert isinstance(result, dict)

    @pytest.mark.parametrize("position", [(1, 1), (0, 0), (9, 7), (19, 19)])
    def test_get_single_unit_moves(self, position: tuple[int, int]):
        board_mock = Mock()
        board_mock._find_move_position.return_value = (True, 1, 1)

        result = Board.get_single_unit_moves(board_mock, position)

        expected_calls = [
            call(position, (-1, 0)),
            call(position, (+1, 0)),
            call(position, (0, -1)),
            call(position, (0, +1)),
        ]
        board_mock._find_move_position.has_calls(expected_calls)
        assert isinstance(result, set)

    @pytest.mark.parametrize("position, expected", [
        ((10, 3), False),
        ((-1, 6), False),
        ((0, 6), True),
        ((0, 8), False)
    ])
    def test_is_position_valid(self, position, expected):
        double = Mock(shape=(9, 7))

        result = Board._is_position_valid(double, position)

        assert result == expected

    @pytest.mark.parametrize("position, move, expected", [
        ((0, 0), (1, -1), (1, -1)),
        ((6, 3), (2, -3), (8, 0)),
        ((7, -7), (-7, 7), (0, 0))
    ])
    def test_get_new_position_tuple(self, position, move, expected):
        result = Board._get_new_position_tuple(position, move)
        assert result == expected

    def test_get_land_position_across_the_water_invalid_position(self):
        move = (1, 0)
        board_mock = MagicMock(spec=Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=True, occupant=EMPTY),
            Mock(water=False, occupant=EMPTY),
        ]
        board_mock._get_new_position_tuple.side_effect = [(2, 1)]
        board_mock._is_position_valid.return_value = False

        result = Board._get_land_position_across_the_water(
            board_mock, (1, 1), move
        )

        board_mock._get_new_position_tuple.assest_called_once_with(
            (1, 1), move
        )
        board_mock._is_position_valid.assest_called_once_with((2, 1))
        assert result == (False, -1, -1)

    def test_get_land_position_across_the_water_mouse_in_water(self):
        move = (1, 0)
        board_mock = MagicMock(spec=Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=True, occupant=EMPTY),
            Mock(water=True, occupant=Mouse(False)),
            Mock(water=False, occupant=EMPTY),
        ]
        board_mock._get_new_position_tuple.side_effect = [(2, 1), (3, 1)]
        board_mock._is_position_valid.return_value = True

        result = Board._get_land_position_across_the_water(
            board_mock, (1, 1), move
        )

        board_mock._get_new_position_tuple.assest_called_once_with(
            (1, 1), move
        )
        board_mock._is_position_valid.assest_called_once_with((2, 1))
        assert result == (False, -1, -1)

    def test_get_land_position_across_the_water_whole_path_empty(self):
        move = (1, 0)
        board_mock = MagicMock(spec=Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=True, occupant=EMPTY),
            Mock(water=True, occupant=EMPTY),
            Mock(water=False, occupant=EMPTY),
        ]
        board_mock._get_new_position_tuple.side_effect = [(2, 1), (3, 1)]
        board_mock._is_position_valid.return_value = True

        result = Board._get_land_position_across_the_water(
            board_mock, (1, 1), move
        )

        board_mock._get_new_position_tuple.assest_has_calls([
            call((1, 1), move),
            call((2, 1), move),
        ])
        board_mock._is_position_valid.assert_has_calls([
            call((2, 1)),
            call((3, 1)),
        ])
        assert result == (True, 3, 1)

    def test_find_move_position_invalid_position(self):
        move = (1, 0)
        position = (3, 1)
        board_mock = MagicMock(spec=Board)
        board_mock.__getitem__.side_effect = [
            Mock(water=False, occupant=Tiger(False)),
        ]
        board_mock._get_new_position_tuple.side_effect = [(4, 1), ]
        board_mock._is_position_valid.return_value = False

        result = Board._find_move_position(board_mock, position, move)

        board_mock._get_new_position_tuple.assest_called_once_with(
            (1, 1), (1, 0)
        )
        board_mock._is_position_valid.assest_called_once_with((4, 1))
        assert result == (False, -1, -1)

    @pytest.mark.parametrize("position, move, new_position", [
        ((2, 2), (1, 0), (3, 2)),
        ((2, 2), (-1, 0), (1, 2)),
        ((2, 2), (0, 1), (2, 3)),
        ((2, 2), (0, -1), (2, 1)),
    ])
    def test_find_move_position_jumps_no_water(
            self,
            position,
            move,
            new_position
    ):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=True),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position_tuple.return_value = new_position

        result = Board._find_move_position(board_mock, position, move)

        board_mock._get_new_position_tuple.assert_called_once_with(
            position, move
        ),
        board_mock._is_position_valid.assert_called_once_with(new_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (True, new_position[0], new_position[1])

    @pytest.mark.parametrize("position, move, next_position, land_position", [
        ((2, 2), (1, 0), (3, 2), (6, 2)),
        ((6, 4), (-1, 0), (4, 4), (2, 4)),
        ((4, 0), (0, 1), (4, 1), (4, 3)),
        ((6, 6), (0, -1), (5, 5), (6, 3)),
    ])
    def test_find_move_position_jumps_over_water(
            self,
            position,
            move,
            next_position,
            land_position
    ):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=True),
            can_capture=Mock(return_value=True),
        )
        water_1 = Mock(water=True, occupant=EMPTY)
        new_land_cell = Mock(water=True)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, water_1, new_land_cell]
        board_mock._get_new_position_tuple.side_effect = [next_position, ]
        board_mock._is_position_valid.return_value = True
        board_mock._get_land_position_across_the_water.return_value = (
            True, *land_position
        )

        result = Board._find_move_position(board_mock, position, move)

        board_mock._get_new_position_tuple.assest_called_once_with(position,
                                                                   move)
        board_mock._is_position_valid.assest_called_once_with(next_position)
        board_mock._get_land_position_across_the_water.assert_called_once_with(
            next_position, move
        )
        old_cell.can_capture.assert_called_once_with(new_land_cell)
        assert result == (True, *land_position)

    @pytest.mark.parametrize("position, move, next_position", [
        ((2, 2), (1, 0), (3, 2)),
        ((6, 4), (-1, 0), (5, 4)),
        ((4, 0), (0, 1), (4, 1)),
        ((6, 6), (0, -1), (6, 5)),
    ])
    def test_find_move_position_cant_jump_over_water(
            self,
            position,
            move,
            next_position
    ):
        old_cell = Mock(
            water=False,
            occupant=Mock(jumps=False),
            can_capture=Mock(return_value=False)
        )
        new_cell = Mock(water=True)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position_tuple.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = Board._find_move_position(board_mock, position, move)

        board_mock._get_new_position_tuple.assert_called_once_with(position,
                                                                   move)
        board_mock._is_position_valid.assest_called_once_with(next_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (False, -1, -1)

    def test_find_move_position_can_capture_other_on_land(self):
        """
        Tests if given unit can capture other one occupying land cell.
        """
        position = (1, 1)
        move = (1, 0)
        next_position = (2, 1)
        old_cell = Mock(
            water=False,
            occupant=Mock(),
            can_capture=Mock(return_value=True)
        )
        new_cell = Mock(water=False)
        board_mock = MagicMock()
        board_mock.__getitem__.side_effect = [old_cell, new_cell]
        board_mock._get_new_position_tuple.return_value = next_position
        board_mock._is_position_valid.return_value = True

        result = Board._find_move_position(board_mock, position, move)

        board_mock._get_new_position_tuple.assert_called_once_with(position,
                                                                   move)
        board_mock._is_position_valid.assert_called_once_with(next_position)
        assert not board_mock._get_land_position_across_the_water.called
        old_cell.can_capture.assert_called_once_with(new_cell)
        assert result == (True, *next_position)





