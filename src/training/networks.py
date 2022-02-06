from datetime import datetime
from typing import Iterable, Sized

import keras.utils.data_utils
import numpy as np
import tensorflow as tf
from tensorflow.keras import callbacks


class DataGenerator(keras.utils.data_utils.Sequence):

    def __init__(self, data: np.ndarray, batch_size: int):
        self.data = data
        self.batch_size = batch_size

    def __len__(self):
        return round(len(self.data) / self.batch_size + 0.5)

    def __getitem__(self, item):
        data = self.data[self.batch_size * item:self.batch_size * (item + 1)]



def train_nn(data, model, **kwargs):
    early_stop = tf.keras.callbacks.EarlyStopping(
        monitor='val_loss',
        verbose=1,
        mode='min',
        patience=kwargs.get("TRAINING_PATIENCE", 10),
        min_delta=kwargs.get("TRAINING_MIN_DELTA", 0.01)
    )

    training_iteration = kwargs.get("TRAINING_ITERATION", -1)
    timestamp = datetime.now().strftime("%d-%m-%y_%H-%M-%S")
    checkpoint_filepath = f"data/models/training_iteration_{training_iteration}_{timestamp}.h5
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

    validation_split = kwargs.get("VALIDATION_SPLIT", 0)
    if validation_split:
        validation_data_length = int(validation_split * len(data))
        validation_data = data[-validation_data_length:]
        del data[-validation_data_length:]
        validation_generator = Keras
