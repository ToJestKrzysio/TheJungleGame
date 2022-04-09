from unittest import mock

import numpy as np
import pytest

from game import Position
from game.moves import *
from training.generators import GameDataGenerator


class TestGameDataGenerator:
    PATH = "training.generators"

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

        result = GameDataGenerator._update_plane_for_child(planes, child_mock)

        expected[move.value, out_y, out_x] = visits
        assert np.array_equal(result, expected)

    @mock.patch(f"{PATH}.np.isclose", mock.Mock(return_value=True))
    @mock.patch(f"{PATH}.GameDataGenerator._update_plane_for_child")
    def test_generate_probability_planes(self, update_plane_mock):
        child_1 = mock.Mock()
        child_2 = mock.Mock()
        child_3 = mock.Mock()
        node_mock = mock.Mock(child_nodes=[child_1, child_2, child_3])
        mcts_mock = mock.Mock(node=node_mock)

        GameDataGenerator._generate_probability_planes(mcts_mock)

        expected_calls = [
            mock.call(mock.ANY, child_1),
            mock.call(mock.ANY, child_2),
            mock.call(mock.ANY, child_3),
        ]
        update_plane_mock.assert_has_calls(expected_calls)

    def test_generate_empty_probability_planes(self):
        result = GameDataGenerator._generate_empty_probability_planes()

        assert np.array_equal(result, np.zeros(shape=(8, 9, 7)))

    @mock.patch(f"{PATH}.os")
    @mock.patch(f"{PATH}.open")
    @mock.patch(f"{PATH}.pickle.dump")
    @mock.patch(f"{PATH}.get_timestamp")
    def test_save_memory_file(self, get_timestamp_patch, pickle_patch, open_patch, os_patch):
        game_id = 42
        timestamp = "24-02-2022_10:51:17"
        pid = 31

        joined_path_mock = mock.Mock()
        iteration_dir_path_mock = mock.Mock()
        os_patch.getpid.return_value = pid
        os_patch.path.join.return_value = joined_path_mock

        get_timestamp_patch.return_value = timestamp

        generator_mock = mock.Mock(
            spec=GameDataGenerator,
            iteration_dir_path=iteration_dir_path_mock,
        )

        memory_mock = mock.Mock()

        result = GameDataGenerator._save_memory_file(generator_mock, memory_mock, game_id)

        filename = f"training_data_{game_id}_{pid}_{timestamp}.pickle"
        os_patch.path.join.assert_called_once_with(iteration_dir_path_mock, filename)
        assert result == joined_path_mock
        open_patch.assert_called_once_with(joined_path_mock, "wb")
        pickle_patch.assert_called_once_with(memory_mock, mock.ANY)
