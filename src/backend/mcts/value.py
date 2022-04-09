__all__ = ["base_value", "AbstractValue"]

import random
from abc import ABC, abstractmethod
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from mcts import Node


class AbstractValue(ABC):

    @abstractmethod
    def __call__(self, node: "Node") -> float:
        pass


class BaseValue(AbstractValue):

    def __call__(self, node: "Node") -> float:
        game_over, game_state = node.board.find_outcome()
        if game_over:
            return (int(node.board.white_move) * 2 - 1) * game_state
        else:
            return random.random() * 0.4 - 0.2


base_value = BaseValue()
