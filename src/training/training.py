import os.path
import pickle
import sys

from networks import train_nn
from src.game.models import value_policy_model
from src.training.generators import Experience


class ModelTrainer:

    def __init__(self, training_kwargs: dict = None, game_kwargs: dict = None,
                 mcts_kwargs: dict = None, nn_kwargs: dict = None):
        self.training_kwargs = training_kwargs or {}
        self.game_kwargs = game_kwargs or {}
        self.mcts_kwargs = mcts_kwargs or {}
        self.nn_kwargs = nn_kwargs or {}

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS", 1)
        self.training_data_iteration = self.training_kwargs.get("TRAINING_ITERATION", -1)
        self.input_data_base_dir = self.training_kwargs.get("INPUT_DIR", "../data/training/")

        self.input_dir = os.path.join(self.input_data_base_dir,
                                      f"iteration_{self.training_data_iteration}")

    def __call__(self, *args, **kwargs):
        for training_id in range(self.training_iterations):
            # TODO loading NN and passing it down
            # data_generator = GameDataGenerator(game_kwargs=self.game_kwargs,
            #                                    mcts_kwargs=self.mcts_kwargs)
            # training_data_filepath = data_generator.generate(training_id)
            training_data = []
            for filename in os.listdir(self.input_dir):
                filepath = os.path.join(self.input_dir, filename)

                with open(filepath, "rb") as file_:
                    training_data.extend(pickle.load(file_))

            model = value_policy_model
            model.load("model_0")
            history, model_filename = train_nn(training_data, model.model, **self.nn_kwargs)
            model.save("model_0_trained_1")

            return history, model_filename


if __name__ == '__main__':
    model_trainer = ModelTrainer(
        training_kwargs={
            "TRAINING_ITERATIONS": 10,
            "TRAINING_ITERATION": 0,
            "INPUT_DIR": "../data/training/"
        },
        game_kwargs={},
        mcts_kwargs={},
        nn_kwargs={"EPOCHS": 30}
    )

    history, model_filename = model_trainer()
    print(model_filename)
    with open("history.pickle", "wb") as file_:
        pickle.dump(history, file_)
