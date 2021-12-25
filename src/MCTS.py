from __future__ import annotations

from math import log, inf, sqrt
import random
from typing import List

from src.game_engine.board import Board


EXPLORATION_COEFFICIENT_C = 2


class MCTS:
    evaluations = 0
    max_evaluations = 1

    def __init__(self, initial_board: Board, max_evaluations: int):
        """
        Prepares conditions to run the simulation.
        """
        self.nodes = Node(initial_board)
        type(self).evaluations = 0
        type(self).max_evaluations = max_evaluations


    def evaluate(self):
        """
        Evaluates current tree according to MCTS rules.
        """
        pass


class Node:
    board: Board
    value: float
    visits: int
    nodes: List

    def __init__(self, board: Board, parent: Node = None):
        self.board = board
        self.value = 0
        self.visits = 0
        self.child_nodes = []

    def evaluate(self):
        """
        Evaluates the current node.
        1. If it has not been visited runs a simulation.
        2. If it has been visited generates all possible new nodes or evaluates existing ones.
        """
        if not self.visits:
            self.value = random.random()
            return self.value
        if self.visits == 1:
            self.expand_node()
        self.pick_best_child_node()

    def expand_node(self):

    def pick_best_child_node(self) -> Node:
        """ Selects the best node out of all possible child nodes. """
        best_node = self.child_nodes[0]
        best_value = self.evaluate_child_node(best_node)
        for child_node in self.child_nodes[1:]:
            best_node = child_node if best_value < self.evaluate_child_node(child_node) else best_node
        return best_node

    @staticmethod
    def evaluate_child_node(child_node) -> float:
        """ Calculates the node value for the given child node. """
        average_value = child_node.value / child_node.visits
        exploration_value = EXPLORATION_COEFFICIENT_C * sqrt(log(MCTS.evaluations) / child_node.visits)
        return average_value + exploration_value


if __name__ == '__main__':
