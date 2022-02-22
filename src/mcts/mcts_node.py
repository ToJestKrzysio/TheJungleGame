from __future__ import annotations


from typing import Tuple, List, Optional

from src.game.board import Board
from src.game.unit import Unit
from src.mcts import value, policy


class Node(object):
    board: Board
    value: float
    visits: int
    nodes: List
    move: Optional[Tuple[Unit, Tuple[int, int]]]
    child_nodes: List[Node]

    def __init__(
            self,
            board: Board,
            parent: Optional[Node] = None,
            move: Optional[Tuple[Unit, Tuple[int, int]]] = None
    ):
        self.board = board
        self.parent = parent
        self.move = move
        self.value = 0
        self.visits = 0
        self.child_nodes = []
        self.policy_strategy = policy.base_policy
        self.value_strategy = value.base_value
        self.prior_probability = 0

        if parent is None:
            self.depth = 1
        else:
            self.depth = self.parent.depth + 1

    def evaluate(self) -> None:
        """ Calls current policy. """
        self.policy_strategy(self)

    def get_value(self) -> float:
        """ Calculates value for the current node. """
        return self.value_strategy(self)

    def expand_node(self) -> None:
        """ Generate nodes for each of possible moves. """
        valid_moves = {unit: unit_moves for unit, unit_moves in self.board.moves.items()
                       if unit.white is self.board.white_move}
        for unit, unit_moves in valid_moves.items():
            for move in unit_moves:
                current_position = self.board.positions[unit]
                new_board = self.board.move(unit_position=current_position, selected_move=move)
                new_node = Node(board=new_board, parent=self, move=(unit, move))
                self.child_nodes.append(new_node)

    @property
    def q(self) -> float:
        try:
            return self.value / self.visits
        except ZeroDivisionError:
            return 0
