__all__ = ["move", "forward", "backward", "left", "right", "forward_jump", "backward_jump",
           "left_jump", "right_jump"]

from collections import namedtuple

move = namedtuple("move", ["value", "x", "y"])
forward = move(value=0, x=0, y=1)
backward = move(value=1, x=0, y=-1)
left = move(value=2, x=-1, y=0)
right = move(value=3, x=1, y=0)
forward_jump = move(value=4, x=0, y=3)
backward_jump = move(value=5, x=0, y=-3)
left_jump = move(value=6, x=-2, y=0)
right_jump = move(value=7, x=2, y=0)
