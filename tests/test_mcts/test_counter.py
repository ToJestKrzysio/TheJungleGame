import pytest

from src.mcts.counter import _EvaluationsCounter


class TestEvaluationsCounter:

    def test__init__(self):
        counter = _EvaluationsCounter()

        assert counter.evaluations == 0
        assert counter.max_evaluations == 0

    @pytest.mark.parametrize("value", [3.2, "Test", {1, 2}, {3: 2}, (4, 2), [2, 4]])
    def test__add__not_implemented(self, value):
        counter = _EvaluationsCounter()
        with pytest.raises(NotImplementedError):
            counter += value

    @pytest.mark.parametrize("value", list(range(0, 10)))
    def test__add__(self, value):
        counter = _EvaluationsCounter()

        counter += value

        assert counter.evaluations == value

    @pytest.mark.parametrize("value", list(range(-10, 10)))
    def test__set_max_evaluations(self, value):
        counter = _EvaluationsCounter()

        counter.set_max_evaluations(value)

        assert counter.max_evaluations == value

    @pytest.mark.parametrize("evaluations, max_evaluations, result", [
        (0, 0, True),
        (14, 10, True),
        (0, 7, False),
    ])
    def test__over(self, evaluations, max_evaluations, result):
        counter = _EvaluationsCounter()

        counter.set_max_evaluations(max_evaluations)
        counter += evaluations

        assert counter.over() == result

    @pytest.mark.parametrize("value", list(range(-10, 10)))
    def test_reset(self, value):
        counter = _EvaluationsCounter()
        counter += value
        assert counter.evaluations == value

        counter.reset()

        assert counter.evaluations == 0
