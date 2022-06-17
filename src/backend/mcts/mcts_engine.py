from __future__ import annotations

import logging

from mcts import Node
from mcts.counter import evaluations_counter
from game import Board

EXPLORATION_COEFFICIENT_C = 2


class Root:
    evaluations = 0
    max_evaluations = 1

    def __init__(self, initial_board: Board, **kwargs):
        """ Prepares conditions to run the simulation. """
        self.node = Node(initial_board)
        self.kwargs = kwargs
        self.child_selection = kwargs.get("CHILD_SELECTION", "MAX")
        max_evaluations = kwargs.get("MAX_EVALUATIONS", 100)
        self.counter = evaluations_counter
        self.counter.set_max_evaluations(max_evaluations)
        self.counter.reset()

    def evaluate(self):
        """ Evaluates current tree according to MCTS rules. """
        while not self.counter.over():
            logging.debug(f"Starting rollout. {self.counter}")
            self.node.evaluate()
        best_node = self.find_best_node()
        return best_node, best_node.unit_move

    def find_best_node(self) -> Node:
        if self.child_selection == "ROBUST":
            return self.find_robust_node()
        return self.find_max_node()

    def find_robust_node(self) -> Node:
        best_node = self.node.child_nodes[0]
        for child_node in self.node.child_nodes[1:]:
            if child_node.visits > best_node.visits:
                best_node = child_node
        return best_node

    def find_max_node(self):
        best_node = self.node.child_nodes[0]
        for child_node in self.node.child_nodes[1:]:
            if child_node.total_value > best_node.total_value:
                best_node = child_node
        return best_node


if __name__ == '__main__':
    board = Board.initialize()
    mcts_engine = Root(board)
    best_node, best_move = mcts_engine.evaluate()
