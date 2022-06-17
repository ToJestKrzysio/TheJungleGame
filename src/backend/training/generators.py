import logging
from itertools import cycle
import os
import pickle
from collections import namedtuple
from typing import List, Tuple

from tensorflow import keras
from tensorflow.keras import models
import numpy as np

from mcts import Root, Node
from game import Board, ValuePolicyModel
from helpers import get_timestamp

IncompleteExperience = namedtuple("Experience", ["state", "probability", "q"])
Experience = namedtuple("Experience", ["state", "probability", "q", "reward"])

logging.basicConfig(filename="../runtime.log", level=logging.DEBUG, filemode="w",
                    format="%(asctime)s - %(process)d - %(levelname)s - %(message)s",
                    datefmt="%H:%M:%S")


class GameDataGenerator:

    def __init__(self, game_kwargs, mcts_kwargs):
        self.num_games = game_kwargs.get("NUMBER_OF_GAMES", 10)
        self.terminate_count = game_kwargs.get("TERMINATE_COUNTER", 1000)
        self.training_iteration = game_kwargs.get("TRAINING_ITERATION", -1)
        self.mcts_kwargs = mcts_kwargs
        self.model_name = game_kwargs.get("MODEL_NAME", "first_model")
        self.model = ValuePolicyModel()
        self.model.set_name(self.model_name)
        self.model.load(self.training_iteration)

        self.iteration_dir_name = f"iteration_{self.training_iteration}"
        self.iteration_dir_path = os.path.join("data/training", self.model.name,
                                               self.iteration_dir_name)
        os.makedirs(self.iteration_dir_path, exist_ok=True)

    def generate(self) -> List[str]:
        return [self._generate(game_id) for game_id in range(self.num_games)]

    def _generate(self, game_id) -> str:

        logging.info(f"Starting game {game_id + 1} of {self.num_games}")
        print(f"Starting game {game_id + 1} of {self.num_games}")

        env = Board.initialize()
        incomplete_experiences = []
        game_over = env.game_over
        outcome = None
        while not game_over:
            player_ = "white" if env.white_move else "black"
            logging.info(f"Turn {env.move_count} moving: {player_}")
            current_game_state = env.to_tensor()
            current_player_value = int(env.white_move) * 2 - 1

            mcts_engine = Root(env, **self.mcts_kwargs)
            best_node, best_move = mcts_engine.evaluate()
            unit, selected_move = best_move
            current_position = env.positions[unit]
            new_env = env.move(current_position, selected_move)

            q_value = mcts_engine.node.q * current_player_value
            probability_planes = self._generate_probability_planes(mcts_engine)
            incomplete_experience = IncompleteExperience(
                state=current_game_state,
                probability=probability_planes,
                q=q_value
            )
            incomplete_experiences.append(incomplete_experience)

            if not new_env.game_over and new_env.move_count >= self.terminate_count:
                game_over = True
                new_game_state = new_env.to_tensor()
                new_q_value = 0
                new_probability_planes = self.generate_empty_probability_vector()

                new_incomplete_experience = IncompleteExperience(
                    state=new_game_state,
                    probability=new_probability_planes,
                    q=new_q_value
                )

                incomplete_experiences.append(new_incomplete_experience)
                # _, outcome = new_env.find_outcome()
                outcome = 0
            else:
                game_over = new_env.game_over
                env = new_env

        if outcome is None:
            _, outcome = env.find_outcome()

        experiences = self.create_experiences(incomplete_experiences, outcome)

        logging.info(f"Game finished with result {outcome} after {env.move_count} moves")
        print(f"Game finished with result {outcome} after {env.move_count} moves.")

        return self._save_memory_file(experiences, game_id)

    def _save_memory_file(self, memory, game_id: int) -> str:
        """
        Given memory of collected Experiences and iteration number saves the data into a pickle
        file and returns path to saved file.

        :param memory: List of Lists of Experiences to save.
        :param game_id: ID of currently played game.

        :return: Path indication saved file.
        """
        pid = os.getpid()
        filename = f"training_data_{game_id}_{pid}_{get_timestamp()}.pickle"

        filepath = os.path.join(self.iteration_dir_path, filename)

        with open(filepath, "wb") as file_:
            pickle.dump(memory, file_)

        return filepath

    @staticmethod
    def create_experiences(incomplete_experiences: List[IncompleteExperience],
                           outcome: float) -> Tuple[Experience, ...]:
        """
        Given list of IncompleteExperiences creates list of Experiences by adding to each
        IncompleteExperience a reward.

        :param incomplete_experiences: List of IncompleteExperiences.
        :param outcome: Result of the simulation, any of those 3 values [-1, 0, 1].

        :return: Tuple of created Experiences.
        """
        return tuple(Experience(
            state=experience.state,
            probability=experience.probability,
            q=experience.q,
            reward=outcome) for experience in incomplete_experiences)

    @staticmethod
    def _generate_empty_probability_planes() -> np.ndarray:
        return np.zeros(shape=(8, 9, 7))

    def generate_empty_probability_vector(self) -> np.ndarray:
        return self._generate_empty_probability_planes().reshape(-1)

    @staticmethod
    def _generate_probability_planes(mcts_root: Root) -> np.ndarray:
        """
        Generates probability planes based on the number of child node visits. More visits indicate
        higher possibility of finding a better reward in the given node.

        :param mcts: Instance of MCTS class storing tree generated during evaluation phase.

        :return: Probability planes represented as ndarray.
        """
        planes = GameDataGenerator._generate_empty_probability_planes()
        children = mcts_root.node.child_nodes
        for child in children:
            planes = GameDataGenerator._update_plane_for_child(planes, child)
        planes /= np.sum(planes)
        if not np.isclose(np.sum(planes), 1):
            raise ValueError("Sum of probabilities is not equal to 1.")
        return planes.reshape(-1)

    @staticmethod
    def _update_plane_for_child(planes: np.ndarray, child: Node) -> np.ndarray:
        """
        Updates child move position with number of visits to that position.

        :param planes: 3D numpy array representing moves.
        :param child: Instance of Node class, holding data about move and visits.

        :return: 3D numpy array representing moves, with updated position equal to child move
            position.
        """
        unit, move = child.unit_move
        visits = child.visits
        plane = move.value
        y, x = child.board.positions[unit]
        planes[plane, y, x] = visits
        return planes


class TournamentDataGenerator:

    def __init__(self, tournament_kwargs, mcts_kwargs):
        """ Loads neural networks and sets up generator parameters. """
        self.network_model_1 = models.load_model(tournament_kwargs["NETWORK_MODEL_1"])
        self.network_model_2 = models.load_model(tournament_kwargs["NETWORK_MODEL_2"])
        self.NUMBER_OF_GAMES = tournament_kwargs.get("TOURNAMENT_GAMES", 2)
        self.mcts_kwargs = mcts_kwargs

    def _get_player_networks(self) -> Tuple[keras.Model, keras.Model]:
        while True:
            yield (self.network_model_1, self.network_model_2), (1, 2)
            yield (self.network_model_2, self.network_model_1), (2, 1)

    def generate(self):
        outcomes = []
        for game_number in range(self.NUMBER_OF_GAMES):
            (network_1, network_2), order = self._get_player_networks()
            outcome, move_count = self._play_tournament_game(network_1, network_2)
            outcomes.append((game_number, outcome, move_count, *order))
        # self._save_results()

    @staticmethod
    def _play_tournament_game(network_1: keras.Model, network_2: keras.Model) -> Tuple[float, int]:
        get_network_model = cycle([network_1, network_2])

        env = Board.initialize()
        print("Starting new game.")

        while not env.game_over:
            current_network_model = next(get_network_model)

            mcts_engine = Root(env)
            best_node, best_move = mcts_engine.evaluate()
            unit, selected_move = best_move
            current_position = env.positions[unit]
            env = env.unit_move(current_position, selected_move)

        _, outcome = env.find_outcome()
        print(f"Game finished with result {outcome} after {env.move_count} moves.")

        return outcome, env.move_count


if __name__ == '__main__':
    import sys

    NUMBER_OF_GAMES = int(sys.argv[1])
    TRAINING_ITERATION = int(sys.argv[2])
    TERMINATE_COUNTER = int(sys.argv[3])
    MAX_EVALUATIONS = int(sys.argv[4])
    MODEL_NAME = str(sys.argv[5])
    CHILD_SELECTION = str(sys.argv[6])

    game_kwargs = {
        "NUMBER_OF_GAMES": NUMBER_OF_GAMES,
        "TRAINING_ITERATION": TRAINING_ITERATION,
        "TERMINATE_COUNTER": TERMINATE_COUNTER,
        "MODEL_NAME": MODEL_NAME,
    }
    mcts_kwargs = {
        "MAX_EVALUATIONS": MAX_EVALUATIONS,
        "CHILD_SELECTION": CHILD_SELECTION,
    }

    data_generator = GameDataGenerator(game_kwargs, mcts_kwargs)
    data_generator.generate()
