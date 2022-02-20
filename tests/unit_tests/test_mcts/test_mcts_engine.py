from unittest import mock

import pytest

from src import mcts
from src.mcts.counter import _EvaluationsCounter


class TestRoot:

    @mock.patch('src.mcts.mcts_engine.evaluations_counter', spec=_EvaluationsCounter)
    @mock.patch('src.mcts.mcts_engine.Node')
    def test__init__(self, node_patch, counter_patch):
        kwargs = {"MAX_EVALUATIONS": 42, "DUMMY": "dummy_value"}
        node_mock = mock.Mock()
        node_patch.return_value = node_mock
        root_mock = mock.Mock(spec=mcts.Root)

        mcts.Root.__init__(self=root_mock, initial_board=mock.Mock(), **kwargs)

        assert root_mock.node is node_mock
        assert root_mock.kwargs == kwargs
        assert root_mock.counter is counter_patch
        assert counter_patch.set_max_evaluations.called_once(kwargs["MAX_EVALUATIONS"])
        assert counter_patch.reset.called_once()

    @mock.patch('src.mcts.mcts_engine.evaluations_counter', spec=_EvaluationsCounter)
    def test_evaluate(self, counter_patch):
        counter_responses = [False, False, True]
        node_mock = mock.Mock(spec=mcts.Node)
        move_mock = mock.Mock()
        best_node_mock = mock.Mock(spec=mcts.Node, move=move_mock)
        counter_patch.over.side_effect = counter_responses
        counter_patch.__iadd__ = lambda x, y: x
        root_mock = mock.Mock(spec=mcts.Root, counter=counter_patch, node=node_mock)
        root_mock.find_best_node.return_value = best_node_mock

        best_node, best_move = mcts.Root.evaluate(root_mock)

        assert best_node is best_node_mock
        assert best_move is move_mock
        assert counter_patch.over.call_count == len(counter_responses)
        assert node_mock.evaluate.call_count == len(counter_responses) - 1

    @pytest.mark.parametrize("value, index", [
        [(1, 2, 3, 4), 3],
        [(0, 0, 0, 0), 3],
        [(7, 3, 9, 2), 2],
        [(91, 0, 3, -2), 0],
    ])
    def test_find_best_node(self, value, index):
        child_node_1 = mock.Mock(value=value[0])
        child_node_2 = mock.Mock(value=value[1])
        child_node_3 = mock.Mock(value=value[2])
        child_node_4 = mock.Mock(value=value[3])
        child_nodes = [child_node_1, child_node_2, child_node_3, child_node_4]
        node = mock.Mock()
        node.child_nodes = child_nodes
        root_mock = mock.Mock(spec=mcts.Root, node=node)

        best_node = mcts.Root.find_best_node(root_mock)

        assert best_node == child_nodes[index]
