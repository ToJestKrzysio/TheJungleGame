from pprint import pprint
from unittest import mock

import numpy as np
import pytest

import src.game.moves
import src.training.generators


class TestGameDataGenerator:
    PATH = "src.training.generators"

    @pytest.mark.parametrize("move, in_x, in_y, out_x, out_y", [
        (src.game.moves.forward, 3, 2, 3, 3),
        (src.game.moves.backward, 0, 1, 0, 0),
        (src.game.moves.left, 6, 3, 5, 3),
        (src.game.moves.right, 3, 6, 4, 6),

        (src.game.moves.forward_jump, 3, 2, 3, 6),
        (src.game.moves.backward_jump, 0, 7, 0, 3),
        (src.game.moves.left_jump, 3, 6, 0, 6),
        (src.game.moves.right_jump, 3, 4, 6, 4),
    ])
    @pytest.mark.parametrize("visits", [42, 11])
    def test_update_plane_for_child(self, move, in_x, in_y, out_x, out_y, visits):
        planes = np.zeros(shape=(8, 9, 7))
        expected = planes.copy()

        unit_mock = mock.Mock()
        positions = {unit_mock: src.game.board.Position(x=in_x, y=in_y)}
        board_mock = mock.Mock(positions=positions)
        child_mock = mock.Mock()
        child_mock.move = (unit_mock, move)
        child_mock.board = board_mock
        child_mock.visits = visits

        result = src.training.generators.GameDataGenerator._update_plane_for_child(planes,
                                                                                   child_mock)

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

        src.training.generators.GameDataGenerator._generate_probability_planes(mcts_mock)

        expected_calls = [
            mock.call(mock.ANY, child_1),
            mock.call(mock.ANY, child_2),
            mock.call(mock.ANY, child_3),
        ]
        update_plane_mock.assert_has_calls(expected_calls)
