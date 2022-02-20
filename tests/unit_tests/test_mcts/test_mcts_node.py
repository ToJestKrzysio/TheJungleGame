from unittest import mock

import pytest
import src.mcts.mcts_node


class TestNode:

    def test__init__no_parent(self):
        node_mock = mock.Mock()
        board_mock = mock.Mock()
        move_mock = mock.Mock()
        src.mcts.mcts_node.Node.__init__(self=node_mock, board=board_mock, move=move_mock,
                                         parent=None)

        assert node_mock.depth == 1

    @pytest.mark.parametrize("depth", [13, 0, 21, 7])
    def test__init__with_parent(self, depth):
        node_mock = mock.Mock()
        board_mock = mock.Mock()
        move_mock = mock.Mock()
        parent = mock.Mock(depth=depth)

        src.mcts.mcts_node.Node.__init__(self=node_mock, board=board_mock, move=move_mock,
                                         parent=parent)

        assert node_mock.depth == depth + 1

    def test_evaluate(self):
        node_mock = mock.Mock(spec=src.mcts.mcts_node.Node)
        policy_strategy = mock.Mock()
        node_mock.policy_strategy = policy_strategy

        src.mcts.mcts_node.Node.evaluate(self=node_mock)

        policy_strategy.assert_called_once_with(node_mock)

    def test_get_value(self):
        node_mock = mock.Mock(spec=src.mcts.mcts_node.Node)
        value_strategy = mock.Mock()
        node_mock.value_strategy = value_strategy

        src.mcts.mcts_node.Node.get_value(self=node_mock)

        value_strategy.assert_called_once_with(node_mock)
