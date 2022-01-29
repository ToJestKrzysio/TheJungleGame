import numpy as np
from src import networks, mcts, game
from tensorflow.keras import models


class GameDataGenerator:

    def __init__(self, game_kwargs, mcts_kwargs):
        self.num_games = game_kwargs.get("NUMBER_OF_GAMES", 10)
        self.training_iterations = game_kwargs.get("TRAINING_ITERATIONS", 10)
        self.terminate = game_kwargs.get("TERMINATE_COUNTER")
        self.nn_model = models.load_model(game_kwargs["NETWORK_MODEL"])
        self.mcts_kwargs = mcts_kwargs

    def generate(self):
        seed = np.random.seed(42)
        env = game.AnimalCheckers()
