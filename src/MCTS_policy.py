import math
from abc import ABC, abstractmethod
from math import inf, sqrt, log

import numpy as np

from src.MCTS import Node, MCTS

__all__ = ["base_policy", "network_policy", "Policy"]


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
        values = [self.get_node_value(node) for node in node.child_nodes]
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


base_policy = BasePolicy()
network_policy = NetworkPolicy()
