from __future__ import annotations

from typing import NamedTuple, Union

from game import Move


class Position(NamedTuple):
    y: int
    x: int

    def __str__(self):
        return f"Position(x={self.x}, y={self.y})"

    def __sub__(self, other: Union[Position, "Move"]):
        return Position(x=self.x - other.x, y=self.y - other.y)

    def __add__(self, other: Union[Position, "Move"]):
        return Position(x=self.x + other.x, y=self.y + other.y)
