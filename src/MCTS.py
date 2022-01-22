from __future__ import annotations

from math import log, inf, sqrt
import random
from typing import List, Tuple, Optional

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


class Node:
    board: Board
    value: float
    visits: int
    nodes: List
    move: Optional[Tuple[Unit, Tuple[int, int]]]

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

    def evaluate(self):
        """
        Evaluates the current node.
        1. If it has not been visited runs a simulation.
        2. If it has been visited generates all possible new nodes or evaluates existing ones.
        """
        if not self.visits:
            self.get_value()
            self.visits += 1
            return None
        if self.visits == 1:
            self.expand_node()
        best_child_node = self.pick_best_child_node()
        best_child_node.evaluate()
        self.value = sum(child_node.value for child_node in self.child_nodes)
        self.visits += 1
        return None

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

    def pick_best_child_node(self) -> Node:
        """ Selects the best node out of all possible child nodes. """
        best_node = self.child_nodes[0]
        best_value = self.evaluate_child_node(best_node)
        for child_node in self.child_nodes[1:]:
            best_node = child_node if best_value < self.evaluate_child_node(
                child_node) else best_node
        return best_node

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
