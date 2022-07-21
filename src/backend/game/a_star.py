from __future__ import annotations

from functools import reduce
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from game import Board, Position, Unit


class Node:

    def __init__(
            self,
            board: "Board",
            unit: "Unit",
            parent: Optional[Node] = None
    ):
        self.board = board
        self.unit = unit
        self.parent = parent
        self.value = 0 if parent is None else parent.value + 1

    def __hash__(self):
        y, x = self.board.positions[self.unit]
        return y * 10 + x

    def __eq__(self, other: Node):
        return self.board.positions[self.unit] == other.board.positions[self.unit]

    def __ge__(self, other: Node):
        return self.value >= other.value

    def __gt__(self, other: Node):
        return self.value > other.value

    def __le__(self, other):
        return self.value <= other.value

    def __lt__(self, other):
        return self.value < other.value


class AStar:

    def __init__(self, board: "Board", unit: "Unit", goal: "Position"):
        self.visited = set()
        self.not_visited = {Node(board, unit)}
        self.goal = goal

    def __call__(self):
        idx = 0
        print(self.not_visited)
        while self.not_visited:
            node_to_visit = reduce(lambda acc, cur: acc if acc <= cur else cur, self.not_visited)
            self.not_visited.remove(node_to_visit)
            self.visited.add(node_to_visit)

            if node_to_visit.board.positions[node_to_visit.unit] == self.goal:
                break

            for move in node_to_visit.board.moves[node_to_visit.unit]:
                position = node_to_visit.board.positions[node_to_visit.unit]
                new_board = node_to_visit.board.move(position, move, ignore_turn=True)
                new_node = Node(new_board, node_to_visit.unit, node_to_visit)

                print(node_to_visit.unit, position, move, new_node.__hash__())

                if new_node in self.visited:
                    continue
                self.not_visited.add(new_node)

            if idx > 100:
                break

            idx += 1

        path = []
        while node_to_visit:
            path.append(node_to_visit)
            node_to_visit = node_to_visit.parent

        return node_to_visit.board.moves[node_to_visit.unit][-1]
