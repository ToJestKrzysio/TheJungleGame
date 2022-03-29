from __future__ import annotations

import logging
from typing import List, Optional

from src.game import Board, UnitMove
from src.mcts import value, policy
from src.mcts.counter import _EvaluationsCounter, evaluations_counter


class Node(object):
    board: Board
    parent: Optional[Node]
    unit_move: Optional[UnitMove]
    total_value: float
    visits: int
    child_nodes: List[Node]
    policy_strategy: policy.AbstractPolicy
    value_strategy: value.AbstractValue
    prior_probability: float
    counter: _EvaluationsCounter

    def __init__(
            self,
            board: Board,
            parent: Optional[Node] = None,
            unit_move: Optional[UnitMove] = None
    ):
        self.board = board
        self.parent = parent
        self.unit_move = unit_move
        self.total_value = 0.0
        self.visits = 0
        self.child_nodes = []
        self.policy_strategy = policy.network_policy
        self.value_strategy = value.base_value
        self.prior_probability = 0.0
        self.counter = evaluations_counter

        if parent is None:
            self.depth = 1
        else:
            self.depth = self.parent.depth + 1

    def __repr__(self):
        return f"Moved {self.unit_move.unit} by {self.unit_move.move}"

    def evaluate(self) -> None:
        """ Calls current policy. """
        self.policy_strategy(self)

    def get_value(self) -> float:
        """ Calculates value for the current node. """
        self.total_value = self.value_strategy(self)
        return self.total_value

    def expand_node(self) -> None:
        """ Generate nodes for each of possible moves. """
        valid_moves = {unit: unit_moves for unit, unit_moves in self.board.moves.items()
                       if unit.white is self.board.white_move}
        for unit, unit_moves in valid_moves.items():
            for move in unit_moves:
                current_position = self.board.positions[unit]
                new_board = self.board.move(unit_position=current_position, selected_move=move)
                new_node = Node(board=new_board, parent=self,
                                unit_move=UnitMove(unit=unit, move=move))
                self.child_nodes.append(new_node)
        logging.debug(
            f"Expanded Node<{id(self)}>. Created in total {len(self.child_nodes)} child nodes.")

    @property
    def q(self) -> float:
        if self.visits == 0:
            return 0
        return self.total_value / self.visits

    def backpropagation(self, reward):
        self.total_value += reward
        self.visits += 1

        if self.parent is not None:
            logging.debug(f"Backpropagating reward {reward:0.3f} from Node<{id(self)}>")
            self.parent.backpropagation(reward)
        else:
            logging.debug(f"Completed backpropagation at Node<{id(self)}>")
            self.counter += 1
