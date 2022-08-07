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
from game.models import ValuePolicyModel, AStarModel
from generators import Experience
from helpers import get_timestamp
from utils.plots import generate_all_plots

os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
logging.basicConfig(filename="../runtime.log", level=logging.DEBUG, filemode="w",
                    format="%(asctime)s - %(process)d - %(levelname)s - %(message)s",
                    datefmt="%H:%M:%S")


class ModelTrainer:

    def __init__(self, training_kwargs: dict = None, game_kwargs: dict = None,
                 mcts_kwargs: dict = None, nn_kwargs: dict = None):
        self.training_kwargs = training_kwargs or {}
        self.game_kwargs = game_kwargs or {}
        self.mcts_kwargs = mcts_kwargs or {}
        self.nn_kwargs = nn_kwargs or {}

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS", 1)
        self.starting_iteration = self.training_kwargs.get("TRAINING_START_ITERATION", 0)
        self.base_dir = self.training_kwargs.get("BASE_DIR", "../data")
        self.nn_kwargs["BASE_DIR"] = self.base_dir
        self.max_processes = self.training_kwargs.get("MAX_PROCESSES", 1)

        # Additional data added to training data from previous iterations
        self.training_previous = self.training_kwargs.get("TRAINING_PREVIOUS", 0)

        self.games_per_iteration = self.training_kwargs.get("GAMES_PER_ITERATION", 50)
        self.rollouts_per_game = self.training_kwargs.get("ROLLOUTS_PER_GAME", 1000)
        self.terminate_counter = self.training_kwargs.get("TERMINATE_COUNTER", 50)

        self.dual_network = self.training_kwargs.get("DUAL_NETWORK", True)
        model_base_name = self.training_kwargs.get("MODEL_BASE_NAME", "model")
        self.model_white = ValuePolicyModel()
        self.model_white.set_name(model_base_name)

        if self.dual_network:
            self.model_black = ValuePolicyModel()
            model_base_name_2 = self.training_kwargs.get("MODEL_2_BASE_NAME", "model")
            self.model_black.set_name(model_base_name_2)
        else:
            self.model_black = AStarModel()
            self.model_black.set_name("dummy_model")

    def __call__(self, generate_data=True, generate_plots=False):
        history, checkpoint_filepath = None, None

        for iteration_id in range(
                self.starting_iteration, self.starting_iteration + self.training_iterations):

            errors = self.generate_data(iteration=iteration_id) if generate_data else False
            if errors:
                raise RuntimeError("Data generation failed")

            training_data = []
            for data_iteration_id in range(
                    max(0, iteration_id - self.training_previous), iteration_id + 1):
                input_dir = self.get_input_dir(iteration=iteration_id)
                training_data.extend(self.load_training_data(input_dir))

            self.model_white.load(filename=iteration_id)
            history, checkpoint_filepath = train_nn(
                training_data, self.model_white, iteration=iteration_id, **self.nn_kwargs)

            self.model_white.load_checkpoint(checkpoint_filepath)
            self.model_white.save(filename=str(iteration_id + 1))
            self.save_history(history=history, iteration=iteration_id, name=self.model_white.name)

            if generate_plots:
                source = os.path.join(self.base_dir, "history", self.model_white.name)
                destination = os.path.join(self.base_dir, "plots", self.model_white.name)
                generate_all_plots(source, destination)

            if self.dual_network:
                model_black_iteration_id = self.model_black.load(-1)
                history_black, checkpoint_filepath_black = train_nn(
                    training_data, self.model_black, iteration=model_black_iteration_id,
                    **self.nn_kwargs)

                self.model_black.load_checkpoint(checkpoint_filepath_black)
                self.model_black.save(filename=str(model_black_iteration_id + 1))
                self.save_history(history=history_black, iteration=model_black_iteration_id,
                                  name=self.model_black.name)

                if generate_plots:
                    source = os.path.join(self.base_dir, "history", self.model_black.name)
                    destination = os.path.join(self.base_dir, "plots", self.model_black.name)
                    generate_all_plots(source, destination)

        return history, checkpoint_filepath

    @staticmethod
    def load_training_data(input_dir: str) -> List["Experience"]:
        """
        Collects all records saved inside input dir and merges them into a single input data.

        :param input_dir: Directory from which data will be loaded.

        :return: List of merged data records.
        """
        training_data = []
        for filename in os.listdir(input_dir):
            filepath = os.path.join(input_dir, filename)

            with open(filepath, "rb") as file_:
                training_data.extend(pickle.load(file_))

        return training_data

    def generate_data(self, iteration: int = -1):
        games = math.ceil(self.games_per_iteration / self.max_processes)

        processes = []
        logging.debug("Starting Data generation")
        for idx in range(self.max_processes):
            processes.append(
                subprocess.Popen(
                    [
                        "python", "../training/generators.py",
                        str(games),
                        str(iteration),
                        str(self.terminate_counter),
                        str(self.rollouts_per_game),
                        str(self.model_white.name),
                        str(self.model_black.name),
                        str(self.mcts_kwargs.get("CHILD_SELECTION", "MAX")),
                        str(self.base_dir),
                        str(int(self.dual_network)),
                        str(idx),
                    ])
            )

        error = False
        for process in processes:
            logging.debug(f"Starting data generation using process {process.pid}")
            error += bool(process.wait())
            logging.debug(f"Completed data generation using process {process.pid}")
        return error

    def get_input_dir(self, iteration: int) -> str:
        """
        Returns data input directory given iteration number.

        :param iteration: Iteration ID defining data folder.

        :return: Relative path to directory from base dir.
        """
        dir_name = f"iteration_{iteration}"
        return os.path.join(self.base_dir, "training", self.model_white.name, dir_name)

    def save_history(self, history: History, iteration: int, name: str) -> None:
        """
        Saves keras History to disc.

        :param history: History to save.
        :param iteration: Number of iteration at which save occurs.
        :param name: Name of the model used for saving.

        :return: None
        """
        base_path = os.path.join(self.base_dir, "history", name)
        os.makedirs(base_path, exist_ok=True)

        filename = f"{get_timestamp()}_{iteration}.json"
        filepath = os.path.join(base_path, filename)
        with open(filepath, "w") as file_:
            logging.info(f"Saving training history to file {filename}.")
            json.dump(history.history, file_)


if __name__ == '__main__':
    training_kwargs = {
        "TRAINING_ITERATIONS": 11,
        "TRAINING_START_ITERATION": 34,
        "TRAINING_PREVIOUS": 0,
        "BASE_DIR": "../data/",
        "MAX_PROCESSES": 10,
        "MODEL_BASE_NAME": "rsm_4",
        "MODEL_2_BASE_NAME": "rsm_5",
        "DUAL_NETWORK": False,
        "GAMES_PER_ITERATION": 200,
        "ROLLOUTS_PER_GAME": 300,
    }
    game_kwargs = {}
    mcts_kwargs = {
        "CHILD_SELECTION": "ROBUST"
    }
    nn_kwargs = {
        "EPOCHS": 15,
        "VALIDATION_SPLIT": 0.10,
    }

    model_trainer = ModelTrainer(training_kwargs, game_kwargs, mcts_kwargs, nn_kwargs)
    model_trainer(generate_data=True, generate_plots=True)
