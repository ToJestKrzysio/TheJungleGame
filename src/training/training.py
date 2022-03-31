import json
import logging
import math
import os.path
import pickle
import subprocess
from typing import List

from keras.callbacks import History

from networks import train_nn
from src.game.models import value_policy_model
from src.training.generators import Experience

logging.basicConfig(filename="../runtime.log", level=logging.DEBUG, filemode="w",
                    format="%(process)d - %(name)s - %(levelname)s - %(message)s")


class ModelTrainer:

    def __init__(self, training_kwargs: dict = None, game_kwargs: dict = None,
                 mcts_kwargs: dict = None, nn_kwargs: dict = None):
        self.training_kwargs = training_kwargs or {}
        self.game_kwargs = game_kwargs or {}
        self.mcts_kwargs = mcts_kwargs or {}
        self.nn_kwargs = nn_kwargs or {}

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS", 1)
        self.input_data_base_dir = self.training_kwargs.get("INPUT_DIR", "../data/training/")
        self.max_processes = self.training_kwargs.get("MAX_PROCESSES", 1)
        self.model_base_name = self.training_kwargs.get("MODEL_BASE_NAME", "model")
        self.games_per_iteration = self.training_kwargs.get("GAMES_PER_ITERATION", 50)
        self.model = value_policy_model

        self.input_dir = None

    def __call__(self, *args, **kwargs):
        for iteration_id in range(self.training_iterations):
            model_name = self.get_model_name(iteration=iteration_id)
            self.model.load(filename=model_name)
            self.generate_data(iteration=iteration_id)

            self.update_input_dir(iteration=iteration_id)
            training_data = self.load_training_data()

            history, model_filename = train_nn(training_data, self.model.model, **self.nn_kwargs)

            self.model.save(filename=self.get_model_name(iteration_id + 1))
            self.save_history(history=history, iteration=iteration_id)

        return history, model_filename

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
                subprocess.Popen(["python", "generators.py", str(games), str(iteration)])
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
        self.input_dir = os.path.join(self.input_data_base_dir, f"iteration_{iteration}")

    def get_model_name(self, iteration: int) -> str:
        """
        Generates new model name using base name and current iteration.

        :return: New of model associated with current iteration.
        """
        return f"{self.model_base_name}_{iteration}"

    def save_history(self, history: History, iteration: int) -> None:
        """
        Saves keras History to disc.

        :param history: History to save.
        :param iteration: Number of iteration at which save occurs.
        :return: None
        """
        filename = f"{self.get_model_name(iteration)}-history.json"
        with open(filename) as file_:
            logging.info(f"Saving training history to file {filename}.")
            json.dump(history.history, file_)


if __name__ == '__main__':
    training_kwargs = {
        "TRAINING_ITERATIONS": 3,
        "INPUT_DIR": "../data/training/",
        "MAX_PROCESSES": 8,
        "MODEL_BASE_NAME": "quick_model",
        "GAMES_PER_ITERATION": 200,
    }
    game_kwargs = {}
    mcts_kwargs = {}
    nn_kwargs = {"EPOCHS": 30}

    model_trainer = ModelTrainer(training_kwargs, game_kwargs, mcts_kwargs, nn_kwargs)
    model_trainer()

    # history, model_filename = model_trainer()
    # print(model_filename)
    # with open("history.pickle", "wb") as file_:
    #     pickle.dump(history, file_)
