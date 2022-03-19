__all__ = ["base_policy", "network_policy", "AbstractPolicy"]

import math
from abc import ABC, abstractmethod
from math import inf, sqrt, log
from typing import TYPE_CHECKING

import numpy as np

from src.mcts.counter import evaluations_counter

if TYPE_CHECKING:
    from src.mcts import Node


class AbstractPolicy(ABC):

    @abstractmethod
    def __call__(self, node: "Node") -> None:
        pass

    @abstractmethod
    def select_child(self, node: "Node") -> "Node":
        pass


class BasePolicy(AbstractPolicy):
    C = 1.5

    def __call__(self, node: "Node"):
        if not node.visits:
            node.total_value = node.get_value()
            node.expand_node()
        else:
            best_child_node = self.select_child(node)
            best_child_node.evaluate()
            node.total_value = sum(child_node.total_value for child_node in node.child_nodes)
        node.visits += 1

    def get_node_value(self, node: "Node") -> float:
        """ Calculates the node value for the given child node. """
        if node.visits == 0:
            return inf
        return node.q + self.C * sqrt(log(evaluations_counter.evaluations) / node.visits)

    def select_child(self, node: "Node") -> "Node":
        values = [self.get_node_value(node) for node in node.child_nodes]
        return node.child_nodes[np.argmax(values)]


class NetworkPolicy(AbstractPolicy):
    EPSILON = 0.25
    ALPHA = 0.5
    C = 1.5

    def __call__(self, node: "Node"):
        if not node.child_nodes:
            value, policy_planes = node.board.predict()
            self._set_child_probabilities(node, policy_planes)
            node.backpropagation(value)
        else:
            child_node = self.select_child(node)
            child_node.evaluate()

    @staticmethod
    def _set_child_probabilities(node: "Node", probability_planes: np.array):
        for child_node in node.child_nodes:
            layer = child_node.unit_move.move.value
            y = child_node.unit_move.move.y
            x = child_node.unit_move.move.x
            child_node.prior_probability = probability_planes[y, x, layer]

    def select_child(self, node: "Node") -> "Node":
        prior_probabilities = np.array(child.prior_probability for child in node.child_nodes)
        psa_probs = ((1 - self.EPSILON) * prior_probabilities
                     + self.EPSILON * np.random.dirichlet([self.ALPHA] * len(node.child_nodes)))
        puct_values = [child.q + self.C * psa * math.sqrt(node.visits) / (1 + child.visits)
                       for child, psa in zip(node.child_nodes, psa_probs)]
        return node.child_nodes[np.argmax(puct_values)]


base_policy = BasePolicy()
network_policy = NetworkPolicy()
