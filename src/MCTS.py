from __future__ import annotations

from typing import List, Tuple, Optional

from src import MCTS_policy, MCTS_value
from src.game.board import Board
from src.game.unit import Unit

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
        self.policy_strategy = MCTS_policy.base_policy
        self.value_strategy = MCTS_value.base_value
        self.prior_probability = 0

    def evaluate(self):
        """ Calls current policy"""
        self.policy_strategy(self)

    def get_value(self):
        """
        Calculates value for the current node.
        """
        self.value_strategy(self)

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


if __name__ == '__main__':
    board = Board.initialize()
    mcts = MCTS(board, 100)
    print(mcts.evaluate())
