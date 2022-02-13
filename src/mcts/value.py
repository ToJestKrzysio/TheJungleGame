__all__ = ["base_value", "Value"]

import random
from abc import ABC, abstractmethod

from src.mcts import mcts_node


class Value(ABC):

    @abstractmethod
    def __call__(self, node: "mcts_node.Node") -> float:
        pass


class BaseValue(Value):

    def __call__(self, node: "mcts_node.Node") -> float:
        game_over, game_state = node.board.find_outcome()
        if game_over:
            return (int(node.board.white_move) * 2 - 1) * game_state
        else:
            return random.random() * 0.4 - 0.2


base_value = BaseValue()
