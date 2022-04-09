from unittest.mock import MagicMock

import pytest

from game import moves, Move, UnitMove, Unit


@pytest.mark.parametrize("value, expected", [
    (moves.forward, moves.forward_jump),
    (moves.backward, moves.backward_jump),
    (moves.left, moves.left_jump),
    (moves.right, moves.right_jump),
])
def test_get_jump_moves(value, expected):
    result = moves.get_jump_move(value)

    assert result == expected


class TestMove:

    @pytest.mark.parametrize("x", list(range(-1, 2)))
    @pytest.mark.parametrize("y", list(range(-1, 2)))
    @pytest.mark.parametrize("value", list(range(-1, 2)))
    @pytest.mark.parametrize("sign", [-1, 1])
    def test_move_str(self, x, y, value, sign):
        move = Move(x=x, y=y, value=value, sign=sign)
        expected = f"Move(x={x}, y={y})"
        assert str(move) == expected


class TestUnitMove:

    @pytest.mark.parametrize("unit_str", ["White Mouse", "Black Dog"])
    @pytest.mark.parametrize("move_str", ["Move(x=1, y=1)", "Move(x=-1, y=-1)"])
    def test_unit_move(self, unit_str, move_str):
        unit = MagicMock(spec=Unit)
        unit.__str__.return_value = unit_str

        move = MagicMock(spec=Move)
        move.__str__.return_value = move_str

        unit_move = UnitMove(unit=unit, move=move)

        expected = f"UnitMove(unit={unit}, move={move})"
        assert str(unit_move) == expected
