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
            game_over = False
            while not env.game_over:
                current_game_state = env.to_tensor()
                current_player_value = int(env.white_move) * 2 - 1

                mcts_engine = mcts.MCTS(env, **self.mcts_kwargs)
                best_node, best_move = mcts_engine.evaluate()
                current_position, new_position = best_move
                env.move(current_position, new_position)

                q_value = mcts_engine.node.q * current_player_value

                # probability_planes = self._generate_probability_planes()
