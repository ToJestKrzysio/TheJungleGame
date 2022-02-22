from __future__ import annotations

from src.mcts.mcts_node import Node
from src.mcts.counter import evaluations_counter
from src.game.board import Board

EXPLORATION_COEFFICIENT_C = 2


class Root:
    evaluations = 0
    max_evaluations = 1

    def __init__(self, initial_board: Board, **kwargs):
        """ Prepares conditions to run the simulation. """
        self.node = Node(initial_board)
        self.kwargs = kwargs
        max_evaluations = kwargs.get("MAX_EVALUATIONS", 100)
        self.counter = evaluations_counter
        self.counter.set_max_evaluations(max_evaluations)
        self.counter.reset()

    def evaluate(self):
        """ Evaluates current tree according to MCTS rules. """
        value = self.counter.over()
        while not value:
            self.node.evaluate()
            self.counter += 1
            value = self.counter.over()
        best_node = self.find_best_node()
        return best_node, best_node.move

    def find_best_node(self) -> Node:
        best_node = self.node.child_nodes[0]
        for child_node in self.node.child_nodes[1:]:
            best_node = best_node if best_node.value > child_node.value else child_node
        return best_node