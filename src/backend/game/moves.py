from __future__ import annotations

__all__ = ["Move", "UnitMove", "forward", "backward", "left", "right", "forward_jump",
           "backward_jump", "left_jump", "right_jump", "base_moves", "jump_moves", "get_jump_move",
           "get_move_by_values"]

from typing import NamedTuple

from game import Unit


class Move(NamedTuple):
    value: int = None
    x: int = None
    y: int = None
    sign: int = 1

    def __str__(self):
        return f"{self.__class__.__name__}(x={self.x}, y={self.y})"


class UnitMove(NamedTuple):
    unit: Unit
    move: Move

    def __str__(self):
        return f"UnitMove(unit={self.unit}, move={self.move})"


forward = Move(value=0, x=0, y=1, sign=1)
backward = Move(value=1, x=0, y=-1, sign=-1)
left = Move(value=2, x=-1, y=0, sign=-1)
right = Move(value=3, x=1, y=0, sign=1)
forward_jump = Move(value=4, x=0, y=4, sign=1)
backward_jump = Move(value=5, x=0, y=-4, sign=-1)
left_jump = Move(value=6, x=-3, y=0, sign=-1)
right_jump = Move(value=7, x=3, y=0, sign=1)

invalid_move = Move(value=-1, x=0, y=0, sign=0)

base_moves = (forward, backward, left, right)
jump_moves = (forward_jump, backward_jump, left_jump, right_jump)


def get_jump_move(move: Move) -> Move:
    jump_mapping = {
        forward: forward_jump,
        backward: backward_jump,
        left: left_jump,
        right: right_jump
    }
    return jump_mapping[move]


def get_move_by_values(x: int, y: int) -> Move:
    value_mappings = {
        (0, 1): forward,
        (0, -1): backward,
        (-1, 0): left,
        (1, 0): right,
        (0, 4): forward_jump,
        (0, -4): backward_jump,
        (3, 0): left_jump,
        (-3, 0): right_jump,
    }
    return value_mappings.get((x, y), invalid_move)
