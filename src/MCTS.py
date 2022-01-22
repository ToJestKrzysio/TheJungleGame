from __future__ import annotations

import math
from abc import ABC, abstractmethod
from math import log, inf, sqrt
import random
from typing import List, Tuple, Optional

import numpy as np

from src.game_engine.board import Board
from src.game_engine.unit import Unit

EXPLORATION_COEFFICIENT_C = 2


class MCTS:
    evaluations = 0
    max_evaluations = 1

    def __init__(self, initial_board: Board, max_evaluations: int):
        """
        Prepares conditions to run the simulation.
        """
        self.node = Node(initial_board)
        type(self).evaluations = 0
        type(self).max_evaluations = max_evaluations

    def evaluate(self):
        """
        Evaluates current tree according to MCTS rules.
        """
        while not self.reached_termination_criteria():
            self.node.evaluate()
            type(self).evaluations += 1
        best_node = self.find_best_node()
        return best_node.move

    @classmethod
    def reached_termination_criteria(cls) -> bool:
        """ Checks if number of evaluations reach maximum evaluations. """
        return cls.evaluations >= cls.max_evaluations

    def find_best_node(self) -> Node:
        best_node = self.node.child_nodes[0]
        for child_node in self.node.child_nodes[1:]:
            best_node = best_node if best_node.value > child_node.value else child_node
        return best_node


class Policy(ABC):

    @abstractmethod
    def __call__(self, node: Node) -> None:
        pass

    @abstractmethod
    def select_child(self, node: Node) -> Node:
        pass


class BasePolicy(Policy):
    C = 1.5

    def __call__(self, node: Node):
        if not node.visits:
            node.get_value()
            node.expand_node()
        else:
            best_child_node = self.select_child(node)
            best_child_node.evaluate()
            node.value = sum(child_node.value for child_node in node.child_nodes)
        node.visits += 1

    def get_node_value(self, node: Node) -> float:
        """ Calculates the node value for the given child node. """
        if node.visits == 0:
            return inf
        return node.q + self.C * sqrt(log(MCTS.evaluations) / node.visits)

    def select_child(self, node: Node) -> Node:
        values = [node.evaluate_child_node(node)
                  for node in node.child_nodes]
        return node.child_nodes[np.argmax(values)]


class NetworkPolicy(Policy):
    EPSILON = 0.25
    ALPHA = 0.5
    C = 1.5

    def __call__(self, node: Node):
        if not node.visits:
            node.get_value()
            node.expand_node()
        else:
            best_child_node = self.select_child(node)
            best_child_node.evaluate()
            node.value = sum(child_node.value for child_node in node.child_nodes)
        node.visits += 1

    def select_child(self, node: Node) -> Node:
        prior_probabilities = np.array(child.prior_probability for child in node.child_nodes)
        psa_probs = ((1 - self.EPSILON) * prior_probabilities
                     + self.EPSILON * np.random.dirichlet([self.ALPHA] * len(node.child_nodes)))
        puct_values = [child.q + self.C * psa * math.sqrt(node.visits) / (1 + child.visits)
                       for child, psa in zip(node.child_nodes, psa_probs)]
        return node.child_nodes[np.argmax(puct_values)]


class Node:
    board: Board
    value: float
    visits: int
    nodes: List
    move: Optional[Tuple[Unit, Tuple[int, int]]]
    child_nodes: List[Node]

    def __init__(
            self,
            board: Board,
            parent: Node = None,
            move: Optional[Tuple[Unit, Tuple[int, int]]] = None
    ):
        self.board = board
        self.parent = parent
        self.move = move
        self.value = 0
        self.visits = 0
        self.child_nodes = []
        self.policy = BasePolicy()
        self.prior_probability = 0

    def evaluate(self):
        """ Calls current policy"""
        self.policy(self)

    def get_value(self):
        """
        Calculates value for the current node.
        TODO implementation of value / policy network
        """
        self.value = random.random()

    def expand_node(self):
        """ generate nodes for each of possible moves. """
        valid_moves = {unit: new_positions for unit, new_positions in self.board.moves.items()
                       if unit.white is self.board.white_move}
        for unit, new_positions in valid_moves.items():
            for new_position in new_positions:
                current_position = self.board.positions[unit]
                new_board = self.board.move(current_position, new_position)
                new_node = Node(board=new_board, parent=self, move=(unit, new_position))
                self.child_nodes.append(new_node)

    @property
    def q(self):
        try:
            self.value / self.visits
        except ZeroDivisionError:
            return 0

    @staticmethod
    def evaluate_child_node(child_node) -> float:
        """ Calculates the node value for the given child node. """
        if child_node.visits == 0:
            return inf
        average_value = child_node.value / child_node.visits
        exploration_value = EXPLORATION_COEFFICIENT_C * sqrt(
            log(MCTS.evaluations) / child_node.visits)
        return average_value + exploration_value


if __name__ == '__main__':
    board = Board.initialize()
    mcts = MCTS(board, 100)
    print(mcts.evaluate())
