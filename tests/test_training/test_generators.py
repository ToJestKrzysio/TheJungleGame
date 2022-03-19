from unittest import mock

import numpy as np
import pytest

from src.game.moves import *
import src.training.generators
from src.game.board import Position


class TestGameDataGenerator:
    PATH = "src.training.generators"

    @pytest.mark.parametrize("move, in_x, in_y, out_x, out_y", [
        (forward, 3, 2, 3, 3),
        (backward, 0, 1, 0, 0),
        (left, 6, 3, 5, 3),
        (right, 3, 6, 4, 6),

        (forward_jump, 3, 2, 3, 6),
        (backward_jump, 0, 7, 0, 3),
        (left_jump, 3, 6, 0, 6),
        (right_jump, 3, 4, 6, 4),
    ])
    @pytest.mark.parametrize("visits", [42, 11])
    def test_update_plane_for_child(self, move, in_x, in_y, out_x, out_y, visits):
        planes = np.zeros(shape=(8, 9, 7))
        expected = planes.copy()

        unit_mock = mock.Mock()
        positions = {unit_mock: Position(x=out_x, y=out_y)}
        board_mock = mock.Mock(positions=positions)
        child_mock = mock.Mock()
        child_mock.unit_move = UnitMove(unit_mock, move)
        child_mock.board = board_mock
        child_mock.visits = visits

        result = src.training.generators.GameDataGenerator._update_plane_for_child(
            planes, child_mock)

        expected[move.total_value, out_y, out_x] = visits
        assert np.array_equal(result, expected)

    @mock.patch(f"{PATH}.np.isclose", mock.Mock(return_value=True))
    @mock.patch(f"{PATH}.GameDataGenerator._update_plane_for_child")
    def test_generate_probability_planes(self, update_plane_mock):
        child_1 = mock.Mock()
        child_2 = mock.Mock()
        child_3 = mock.Mock()
        node_mock = mock.Mock(child_nodes=[child_1, child_2, child_3])
        mcts_mock = mock.Mock(node=node_mock)

        src.training.generators.GameDataGenerator._generate_probability_planes(mcts_mock)

        expected_calls = [
            mock.call(mock.ANY, child_1),
            mock.call(mock.ANY, child_2),
            mock.call(mock.ANY, child_3),
        ]
        update_plane_mock.assert_has_calls(expected_calls)

    def test_generate_empty_probability_planes(self):
        result = src.training.generators.GameDataGenerator._generate_empty_probability_planes()

        assert np.array_equal(result, np.zeros(shape=(8, 9, 7)))

    @mock.patch(f"{PATH}.open")
    @mock.patch(f"{PATH}.pickle.dump")
    @mock.patch(f"{PATH}.datetime.datetime")
    def test_save_memory_file(self, datetime_patch, pickle_patch, open_patch):
        strftime_mock = mock.Mock()
        strftime_mock.strftime.return_value = "24-02-2022_10:51:17"
        datetime_patch.now.return_value = strftime_mock
        generator_mock = mock.Mock(spec=src.training.generators.GameDataGenerator,
                                   training_data_output="")
        memory_mock = mock.Mock()

        result = src.training.generators.GameDataGenerator._save_memory_file(generator_mock,
                                                                             memory_mock, 42)

        assert result == "training_data_42_24-02-2022_10:51:17.pickle"
        open_patch.assert_called_once_with("training_data_42_24-02-2022_10:51:17.pickle", "wb")
        pickle_patch.assert_called_once_with(memory_mock, mock.ANY)
