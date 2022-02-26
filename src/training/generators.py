import datetime
import os
import pickle
from collections import namedtuple
from typing import List

import numpy as np
from src import networks, mcts, game
from tensorflow.keras import models

IncompleteExperience = namedtuple("Experience", ["state", "probability", "q"])
Experience = namedtuple("Experience", ["state", "probability", "q", "reward"])


class GameDataGenerator:

    def __init__(self, game_kwargs, mcts_kwargs):
        self.num_games = game_kwargs.get("NUMBER_OF_GAMES", 10)
        self.training_iteration = game_kwargs.get("TRAINING_ITERATION", 10)
        self.terminate_count = game_kwargs.get("TERMINATE_COUNTER")
        self.nn_model = models.load_model(game_kwargs["NETWORK_MODEL"])
        self.mcts_kwargs = mcts_kwargs
        self.training_data_output = os.path.join("data", "training")
        os.makedirs(self.training_data_output, exist_ok=True)

    def generate(self):
        memory = []
        np.random.seed(42)
        env = game.Board.initialize()

        for game_id in range(self.num_games):
            print(f"Starting game {game_id + 1} of {self.num_games}")

            incomplete_experiences = []
            game_over = env.game_over
            outcome = None
            while not game_over:
                current_game_state = env.to_tensor()
                current_player_value = int(env.white_move) * 2 - 1

                mcts_engine = mcts.Root(env, **self.mcts_kwargs)
                best_node, best_move = mcts_engine.evaluate()
                current_position, new_position = best_move
                new_env = env.move(current_position, new_position)

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
                    new_probability_planes = self._generate_empty_probability_planes()
                    new_incomplete_experience = IncompleteExperience(
                        state=new_game_state,
                        probability=new_probability_planes,
                        q=new_q_value
                    )
                    incomplete_experiences.append(new_incomplete_experience)
                    _, outcome = new_env.find_outcome()

            if not outcome:
                _, outcome = env.find_outcome()
            experiences = self.create_experiences(incomplete_experiences, outcome)
            memory.extend(experiences)
            print(f"Game finished with result {outcome} after {env.move_count} moves.")

            return self._save_memory_file(memory, self.training_iteration)

    def _save_memory_file(self, memory,
                          training_iteration: int) -> str:
        """
        Given memory of collected Experiences and iteration number saves the data into a pickle
        file and returns path to saved file.

        :param memory: List of Lists of Experiences to save.
        :param training_iteration: Number of iteration for which data was generated.

        :return: Path indication saved file.
        """
        timestamp = datetime.datetime.now().strftime("%d-%m-%y_%H:%M:%S")
        filename = f"training_data_{training_iteration}_{timestamp}.pickle"
        filepath = os.path.join(self.training_data_output, filename)

        with open(filepath, "wb") as file_:
            pickle.dump(memory, file_)

        return filepath

    @staticmethod
    def create_experiences(incomplete_experiences,
                           outcome: int):
        """
        Given list of IncompleteExperiences creates list of Experiences by adding to each
        IncompleteExperience a reward.

        :param incomplete_experiences: List of IncompleteExperiences.
        :param outcome: Result of the simulation, any of those 3 values [-1, 0, 1].

        :return: List of created Experiences.
        """
        experiences = []
        for experience in incomplete_experiences:
            experiences.append(Experience(
                state=experience.state,
                probability=experience.probability,
                q=experience.q,
                reward=outcome,
            ))
        return experiences

    @staticmethod
    def _generate_empty_probability_planes() -> np.ndarray:
        return np.zeros(shape=(8, 9, 7))

    @staticmethod
    def _generate_probability_planes(mcts: mcts.Root) -> np.ndarray:
        """
        Generates probability planes based on the number of child node visits. More visits indicate
        higher possibility of finding a better reward in the given node.

        :param mcts: Instance of MCTS class storing tree generated during evaluation phase.

        :return: Probability planes represented as ndarray.
        """
        planes = GameDataGenerator._generate_empty_probability_planes
        children = mcts.node.child_nodes
        for child in children:
            planes = GameDataGenerator._update_plane_for_child(planes, child)
        planes /= np.sum(planes)
        if not np.isclose(np.sum(planes), 1):
            raise ValueError("Sum of probabilities is not equal to 1.")
        return planes

    @staticmethod
    def _update_plane_for_child(planes: np.ndarray, child: mcts.mcts_node.Node) -> np.ndarray:
        """
        Updates child move position with number of visits to that position.

        :param planes: 3D numpy array representing moves.
        :param child: Instance of Node class, holding data about move and visits.

        :return: 3D numpy array representing moves, with updated position equal to child move
            position.
        """
        unit, move = child.move
        visits = child.visits
        plane = move.value
        current_y, current_x = child.board.positions[unit]
        y = current_y + move.y
        x = current_x + move.x
        planes[plane, y, x] = visits
        return planes


class TournamentDataGenerator:
    pass
