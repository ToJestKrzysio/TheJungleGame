from unittest import mock
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
        root_mock = mock.Mock(spec=mcts.Root, counter=counter_patch, node=node_mock)
        root_mock.find_best_node.return_value = best_node_mock

        best_node, best_move = mcts.Root.evaluate(root_mock)

        assert best_node is best_node_mock
        assert best_move is move_mock
        assert counter_patch.over.call_count == len(counter_responses)
        # assert node_mock.evaluate.call_count == len(counter_responses) - 1
