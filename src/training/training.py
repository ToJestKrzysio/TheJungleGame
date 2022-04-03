import json
import logging
import math
import os

import os.path
import pickle
import subprocess
from typing import List

from keras.callbacks import History

from networks import train_nn
from src.game.models import value_policy_model
from src.training.generators import Experience
from src.training.helpers import get_timestamp

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
logging.basicConfig(filename="../runtime.log", level=logging.INFO, filemode="w",
                    format="%(process)d - %(name)s - %(levelname)s - %(message)s")


class ModelTrainer:

    def __init__(self, training_kwargs: dict = None, game_kwargs: dict = None,
                 mcts_kwargs: dict = None, nn_kwargs: dict = None):
        self.training_kwargs = training_kwargs or {}
        self.game_kwargs = game_kwargs or {}
        self.mcts_kwargs = mcts_kwargs or {}
        self.nn_kwargs = nn_kwargs or {}

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS", 1)
        self.starting_iteration = self.training_kwargs.get("TRAINING_START_ITERATION", 0)
        self.input_data_base_dir = self.training_kwargs.get("INPUT_DIR", "../data/training/")
        self.max_processes = self.training_kwargs.get("MAX_PROCESSES", 1)

        self.games_per_iteration = self.training_kwargs.get("GAMES_PER_ITERATION", 50)
        self.rollouts_per_game = self.training_kwargs.get("ROLLOUTS_PER_GAME", 1000)
        self.terminate_counter = self.training_kwargs.get("TERMINATE_COUNTER", 50)

        self.model = value_policy_model
        model_base_name = self.training_kwargs.get("MODEL_BASE_NAME", "model")
        self.model.set_name(model_base_name)

        self.input_dir = None

    def __call__(self, generate_data=True):
        history, best_checkpoint_filepath = None, None

        for iteration_id in range(self.starting_iteration, self.training_iterations):
            self.model.load(filename=str(iteration_id))
            if generate_data:
                self.generate_data(iteration=iteration_id)

            self.update_input_dir(iteration=iteration_id)
            training_data = self.load_training_data()

            history, checkpoint_filepath = train_nn(
                training_data, self.model, iteration=iteration_id, **self.nn_kwargs)

            self.model.load_checkpoint(checkpoint_filepath)
            self.model.save(filename=str(iteration_id + 1))
            self.save_history(history=history, iteration=iteration_id)

        return history, checkpoint_filepath

    def load_training_data(self) -> List["Experience"]:
        """
        Collects all records saved inside input dir and merges them into a single input data.

        :return: List of merged data records.
        """
        training_data = []
        for filename in os.listdir(self.input_dir):
            filepath = os.path.join(self.input_dir, filename)

            with open(filepath, "rb") as file_:
                training_data.extend(pickle.load(file_))

        return training_data

    def generate_data(self, iteration: int = -1):
        games = math.ceil(self.games_per_iteration / self.max_processes)

        processes = []
        logging.debug("Starting Data generation")
        for idx in range(self.max_processes):
            processes.append(
                subprocess.Popen(["python", "generators.py", str(games), str(iteration),
                                  str(self.terminate_counter), str(self.rollouts_per_game)])
            )

        for process in processes:
            logging.debug(f"Waiting for process {process.pid}")
            process.wait()

    def update_input_dir(self, iteration: int) -> None:
        """
        Updates training directory to path specified according to iteration number.

        :param iteration: Number of iteration from which data will be gathered.

        :return: None
        """
        dir_name = f"iteration_{iteration}"
        self.input_dir = os.path.join(self.input_data_base_dir, dir_name)

    def save_history(self, history: History, iteration: int) -> None:
        """
        Saves keras History to disc.

        :param history: History to save.
        :param iteration: Number of iteration at which save occurs.
        :return: None
        """
        base_path = os.path.join(f"../data/history", self.model.name)
        os.makedirs(base_path, exist_ok=True)

        filename = f"{get_timestamp()}_{iteration}.json"
        filepath = os.path.join(f"../data/history", self.model.name, filename)
        with open(filepath, "w") as file_:
            logging.info(f"Saving training history to file {filename}.")
            json.dump(history.history, file_)


if __name__ == '__main__':
    training_kwargs = {
        "TRAINING_ITERATIONS": 5,
        "TRAINING_START_ITERATION": 0,
        "INPUT_DIR": "../data/training/",
        "MAX_PROCESSES": 7,
        "MODEL_BASE_NAME": "first_model",
        "GAMES_PER_ITERATION": 200,
        "ROLLOUTS_PER_GAME": 300,
    }
    game_kwargs = {}
    mcts_kwargs = {}
    nn_kwargs = {
        "EPOCHS": 40,
        "VALIDATION_SPLIT": 0.15,
    }

    model_trainer = ModelTrainer(training_kwargs, game_kwargs, mcts_kwargs, nn_kwargs)
    model_trainer(generate_data=True)
