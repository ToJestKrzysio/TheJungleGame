__all__ = ["Move", "forward", "backward", "left", "right", "forward_jump", "backward_jump",
           "left_jump", "right_jump", "base_moves", "get_jump_move"]

from collections import namedtuple

Move = namedtuple("Move", ["value", "x", "y", "sign"], defaults=[None, None, None, 1])
forward = Move(value=0, x=0, y=1, sign=1)
backward = Move(value=1, x=0, y=-1, sign=-1)
left = Move(value=2, x=-1, y=0, sign=-1)
right = Move(value=3, x=1, y=0, sign=1)
forward_jump = Move(value=4, x=0, y=4, sign=1)
backward_jump = Move(value=5, x=0, y=-4, sign=-1)
left_jump = Move(value=6, x=-3, y=0, sign=-1)
right_jump = Move(value=7, x=3, y=0, sign=1)

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
