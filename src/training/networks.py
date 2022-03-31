import math
from datetime import datetime
from typing import Tuple, TYPE_CHECKING, List

import keras.utils.data_utils
import numpy as np
import tensorflow as tf
from tensorflow.keras import callbacks

if TYPE_CHECKING:
    from src.training.generators import Experience
    from keras.models import Model


class DataGenerator(keras.utils.data_utils.Sequence):

    def __init__(self, data: Tuple["Experience", ...], batch_size: int):
        self.data = data
        self.batch_size = batch_size

    def __len__(self):
        return math.ceil(len(self.data) / self.batch_size)

    def __getitem__(self, idx: int):
        data = self.data[self.batch_size * idx: self.batch_size * (idx + 1)]

        size = len(data)
        state = data[0].state
        probability = data[0].probability
        q_value = data[0].q
        reward = data[0].reward

        states = np.empty(shape=(size, *state.shape))
        probabilities = np.empty(shape=(size, *probability.shape))
        q_values = np.empty(shape=(size,))
        rewards = np.empty(shape=(size,))

        states[0] = state
        probabilities[0] = probability
        q_values[0] = q_value
        rewards[0] = reward

        for data_id, experience in enumerate(data):
            states[data_id] = experience.state
            probabilities[data_id] = experience.probability
            q_values[data_id] = experience.q
            rewards[data_id] = experience.reward

        return [states, [(rewards + q_values) / 2, probabilities]]


def train_nn(data, model: "Model", **kwargs):
    epochs = kwargs.get("EPOCHS", 10)
    training_iteration = kwargs.get("TRAINING_ITERATION", -1)
    validation_split = kwargs.get("VALIDATION_SPLIT", 0)
    batch_size = kwargs.get("BATCH_SIZE", 32)
    patience = kwargs.get("TRAINING_PATIENCE", 10)
    min_delta = kwargs.get("TRAINING_MIN_DELTA", 0.01)

    # early_stop = tf.keras.callbacks.EarlyStopping(
    #     monitor='loss',
    #     verbose=1,
    #     mode='min',
    #     patience=patience,
    #     min_delta=min_delta,
    # )

    timestamp = datetime.now().strftime("%d-%m-%y_%H-%M-%S")
    checkpoint_filepath = f"data/models/training_iteration_{training_iteration}_{timestamp}.h5"
    save_best_model = callbacks.ModelCheckpoint(
        filepath=checkpoint_filepath,
        monitor="val_loss",
        verbose=1,
        save_best_only=True,
        save_weights_only=False,
        mode="auto",
        save_freq="epoch"
    )

    np.random.shuffle(data)

    training_generator = DataGenerator(data, batch_size)
    steps_per_epoch = len(training_generator)

    validation_generator = None
    validation_steps = 0 if validation_generator is None else len(validation_generator)

    history = model.fit(
        x=training_generator,
        steps_per_epoch=steps_per_epoch,
        # validation_data=validation_generator,
        # validation_steps=validation_steps,
        epochs=epochs,
        shuffle=True,
        # callbacks=[early_stop, save_best_model],
        use_multiprocessing=True
    )

    return history, checkpoint_filepath
