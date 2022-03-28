import pickle
import sys

from networks import train_nn
from src.game.models import ValuePolicyModel
from src.training.generators import Experience

class ModelTrainer:

    def __init__(self, training_kwargs: dict = None, game_kwargs: dict = None,
                 mcts_kwargs: dict = None, nn_kwargs: dict = None):
        self.training_kwargs = training_kwargs or {}
        self.game_kwargs = game_kwargs or {}
        self.mcts_kwargs = mcts_kwargs or {}
        self.nn_kwargs = nn_kwargs or {}

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS", 1)

    def __call__(self, *args, **kwargs):
        for training_id in range(self.training_iterations):
            self.game_kwargs["TRAINING_ITERATION"] = training_id
            # TODO loading NN and passing it down
            # data_generator = GameDataGenerator(game_kwargs=self.game_kwargs,
            #                                    mcts_kwargs=self.mcts_kwargs)
            # training_data_filepath = data_generator.generate(training_id)

            training_data_filepath = "./data/training/training_data_0_25-03-22_18:47:32.pickle"
            with open(training_data_filepath, "rb") as file_:
                training_data = pickle.load(file_)

            model = ValuePolicyModel()
            history, model_filename = train_nn(training_data, model.model)

            return history, model_filename


if __name__ == '__main__':
    model_trainer = ModelTrainer({}, {}, {}, {})
    # import os
    # print(os.listdir("data/training"))

    training_data_filepath = "./data/training/training_data_0_25-03-22_18:47:32.pickle"
    with open(training_data_filepath, mode="rb") as file_:
        training_data = pickle.load(file_)

    history, model_filename = model_trainer()
    print(model_filename)
    with open("history.pickle", "wb") as file_:
        pickle.dump(history, file_)
