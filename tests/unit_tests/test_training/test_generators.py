from unittest import mock

import numpy as np
import pytest

import src.training.generators


class TestGameDataGenerator:

    @pytest.mark.parametrize("children, expected", [
        [
            (mock.Mock(), mock.Mock(), mock.Mock()),
            np.ndarray(
                [
                    [],

                ]
            )
        ],
    ])
    def test_generate_probability_planes(self, children, expected):
        mcts = mock.Mock()
        mcts.node.children = children

        result = src.training.generators.GameDataGenerator._generate_probability_planes(mcts)

        assert result == expected
