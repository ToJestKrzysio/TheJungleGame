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
        env = game.Board.initialize()
        for game_id in range(self.num_games):
            print(f"Starting game {game_id + 1} of {self.num_games}")
            actions = []
            state = env.to_tensor()
            mcts_engine = mcts.MCTS(env, **self.mcts_kwargs)
            game_over = False
            while not env.game_over:
                if env.white_move:
                    mcts_engine.evaluate()
                    best_child =
                    env.move
                else:
