import pytest

from src.game import moves


@pytest.mark.parametrize("value, expected", [
    (moves.forward, moves.forward_jump),
    (moves.backward, moves.backward_jump),
    (moves.left, moves.left_jump),
    (moves.right, moves.right_jump),
])
def test_get_jump_moves(value, expected):
    result = moves.get_jump_move(value)

    assert result == expected
