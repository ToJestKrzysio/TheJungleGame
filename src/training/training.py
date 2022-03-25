from training.generators import GameDataGenerator


class ModelTrainer:

    def __init__(self, training_kwargs: dict, game_kwargs: dict, mcts_kwargs: dict,
                 nn_kwargs: dict):
        self.training_kwargs = training_kwargs
        self.game_kwargs = game_kwargs
        self.mcts_kwargs = mcts_kwargs
        self.nn_kwargs = nn_kwargs

        self.training_iterations = self.training_kwargs.get("TRAINING_ITERATIONS")

    def __call__(self, *args, **kwargs):
        for training_id in range(self.training_iterations):
            self.game_kwargs["TRAINING_ITERATION"] = training_id
            # TODO loading NN and passing it down
            data_generator = GameDataGenerator(game_kwargs=self.game_kwargs,
                                               mcts_kwargs=self.mcts_kwargs)
            training_data_filepath = data_generator.generate(training_id)


            # train using data
