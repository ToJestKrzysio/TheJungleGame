import math
import os
from datetime import datetime
from typing import Tuple, TYPE_CHECKING

import keras.utils.data_utils
import numpy as np
import tensorflow as tf
from tensorflow.keras import callbacks

from game import AbstractModel
from helpers import get_timestamp

if TYPE_CHECKING:
    from src.training.generators import Experience


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

        return [states, [(3 * rewards + q_values) / 4, probabilities]]


def train_nn(data, model_instance: "AbstractModel", iteration: int = -1, **kwargs):
    model = model_instance.model

    epochs = kwargs.get("EPOCHS", 10)
    validation_split = kwargs.get("VALIDATION_SPLIT", 0)
    batch_size = kwargs.get("BATCH_SIZE", 32)
    patience = kwargs.get("TRAINING_PATIENCE", 6)
    min_delta = kwargs.get("TRAINING_MIN_DELTA", 0.01)

    early_stop = tf.keras.callbacks.EarlyStopping(
        monitor='loss',
        verbose=1,
        mode='min',
        patience=patience,
        min_delta=min_delta,
    )

    filename = f"{get_timestamp()}_iteration_{iteration}.h5"
    checkpoint_filepath = os.path.join(f"../data/checkpoints/", model_instance.name, filename)
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
    training_data_length = int(len(data) * (1 - validation_split))
    training_data = data[:training_data_length]
    validation_data = data[training_data_length:]

    training_generator = DataGenerator(data=training_data, batch_size=batch_size)
    steps_per_epoch = len(training_generator)

    validation_generator = DataGenerator(data=validation_data, batch_size=batch_size)
    validation_steps = len(validation_generator)

    history = model.fit(
        x=training_generator,
        steps_per_epoch=steps_per_epoch,
        validation_data=validation_generator,
        validation_steps=validation_steps,
        epochs=epochs,
        shuffle=True,
        callbacks=[early_stop, save_best_model],
        use_multiprocessing=True
    )

    return history, checkpoint_filepath
