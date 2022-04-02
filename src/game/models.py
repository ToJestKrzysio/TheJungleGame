import logging
import os
from abc import ABC, abstractmethod
from typing import Tuple, TYPE_CHECKING

import numpy as np
from tensorflow.keras import regularizers, optimizers, layers, Model
from tensorflow.keras.models import load_model

if TYPE_CHECKING:
    from src.game import BoardTensor


class AbstractModel(ABC):
    model: Model
    name: str

    def __init__(self, **kwargs):
        self.name = ""

    @abstractmethod
    def predict(self, tensor: "BoardTensor", mask: np.array) -> Tuple[float, np.ndarray]:
        pass


class ValuePolicyModel(AbstractModel):

    def __init__(self, **kwargs):
        super().__init__()
        self.conv_kernel_reg = regularizers.l2(
            kwargs.get("CONVOLUTIONAL_KERNEL_REGULARIZATION", 0.01))
        self.conv_bias_reg = regularizers.l2(
            kwargs.get("CONVOLUTIONAL_BIAS_REGULARIZATION", 0.01))

        self.dense_kernel_reg = regularizers.l2(
            kwargs.get("DENSE_KERNEL_REGULARIZATION", 0.01))
        self.dense_bias_reg = regularizers.l2(
            kwargs.get("DENSE_BIAS_REGULARIZATION", 0.01))

        self.num_filters = kwargs.get("NUMBER_OF_FILTERS", 12)
        self.policy_loss_weight = kwargs.get("POLICY_LOSS_WEIGHT", 0.01)
        self.value_loss_weight = kwargs.get("VALUE_LOSS_WEIGHT", 0.01)
        self.input_shape = (9, 7, 178)
        self.output_shape = (9, 7, 8)
        self.conv_blocks = kwargs.get("CONVOLUTIONAL_BLOCKS", 6)
        self.model = self.create_model()
        self.base_dir = kwargs.get("BASE_DIR", "../data/models")

        # self._cache = {} # TODO ADD CACHE

    def create_model(self):
        model_input = layers.Input(shape=self.input_shape)
        input_layer = model_input
        for layer_id in range(self.conv_blocks):
            input_layer = self.get_conv_block(input_layer, layer_id)
        final_conv_layer = input_layer
        policy_head = self.get_policy_head(final_conv_layer)
        value_head = self.get_value_head(final_conv_layer)

        model = Model(model_input, [value_head, policy_head])
        model.compile(
            loss={
                "Policy_Head": "categorical_crossentropy",
                "Value_Head": "mse"
            },
            loss_weights={
                "Policy_Head": self.policy_loss_weight,
                "Value_Head": self.value_loss_weight
            },
            optimizer=optimizers.Adam()
        )
        return model

    def set_name(self, name: str):
        self.name = name

    def load(self, filename: str):
        filepath = os.path.join(self.base_dir, self.name, filename)
        self.model = load_model(filepath)
        logging.info(f"Loaded karas model from '{filepath}'")

    def load_checkpoint(self, filepath: str):
        self.model = load_model(filepath)
        logging.info(f"Loaded karas checkpoint data from '{filepath}'")

    def save(self, filename: str):
        filepath = os.path.join(self.base_dir, self.name, filename)
        self.model.save(filepath)
        logging.info(f"Saved karas model to '{filepath}'")

    def get_conv_block(self, input_layer: layers.Layer, layer_id: int) -> layers.Layer:
        conv_layer = layers.Conv2D(filters=self.num_filters, kernel_size=(3, 3), padding="same",
                                   activation="relu", use_bias=True, data_format="channels_last",
                                   kernel_regularizer=self.conv_kernel_reg,
                                   bias_regularizer=self.conv_bias_reg,
                                   name=f"Convolutional_Layer_{layer_id}")(input_layer)
        batch_norm = layers.BatchNormalization(
            axis=-1, name=f"Batch_Normalization_{layer_id}")(conv_layer)
        return batch_norm

    def get_policy_head(self, input_layer: layers.Layer):
        conv_layer_1 = layers.Conv2D(
            filters=self.num_filters, kernel_size=(3, 3), padding="same", activation="relu",
            use_bias=True, data_format="channels_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Policy_Convolutional_Layer_1")(input_layer)
        batch_norm_1 = layers.BatchNormalization(
            axis=-1, name="Policy_Batch_Normalization_1")(conv_layer_1)
        conv_layer_2 = layers.Conv2D(
            filters=1, kernel_size=(1, 1), padding="same", activation="relu",
            use_bias=True, data_format="channels_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Policy_Convolutional_Layer_2")(batch_norm_1)
        batch_norm_2 = layers.BatchNormalization(
            axis=-1, name="Policy_Batch_Normalization_2")(conv_layer_2)
        flatten_layer = layers.Flatten(name="Policy_Flatten_Layer")(batch_norm_2)
        output_layer = layers.Dense(
            np.product(self.output_shape), activation='softmax', use_bias=True,
            kernel_regularizer=self.dense_kernel_reg, bias_regularizer=self.dense_kernel_reg,
            name='Policy_Head')(flatten_layer)
        return output_layer

    def get_value_head(self, input_layer: layers.Layer):
        conv_layer = layers.Conv2D(
            filters=1, kernel_size=(1, 1), padding="same", activation="relu", use_bias=True,
            data_format="channels_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Value_Convolutional_Layer")(input_layer)
        batch_norm_1 = layers.BatchNormalization(
            axis=-1, name="Value_Batch_Normalization_1")(conv_layer)
        flatten_layer = layers.Flatten(name="Value_Flatten_Layer")(batch_norm_1)
        dense_layer = layers.Dense(
            64, activation="relu", use_bias=True, kernel_regularizer=self.dense_kernel_reg,
            bias_regularizer=self.dense_bias_reg, name="Value_Dense_Layer")(flatten_layer)
        batch_norm_2 = layers.BatchNormalization(
            axis=-1, name="Value_Batch_Normalization_2")(dense_layer)
        output_layer = layers.Dense(
            1, activation="tanh", use_bias=True, kernel_regularizer=self.dense_kernel_reg,
            bias_regularizer=self.dense_bias_reg, name="Value_Head")(batch_norm_2)
        return output_layer

    def predict(self, tensor: "BoardTensor", mask: np.array) -> Tuple[float, np.ndarray]:
        """
        Given tensor and mask executes following algorithm.
        1. Predict value (float) and policy (array 9x7x8) using NN provided with tensor.
        2. Applies mask to remove invalid policies.
        3. Normalizes masked array.

        :param tensor: Array representing current and previous board states.
        :param mask: Boolean array, 1's indicate valid moves and 0's invalid.

        :return: Tuple
        """
        # TODO add cache (shouldn't mess training but increase overall performance of predictions)
        if tensor.shape == self.input_shape:
            tensor = np.expand_dims(tensor, axis=0)
        value, policy = self.model.predict(tensor)

        value = value[0][0]

        policy = policy.reshape(self.output_shape)
        policy *= mask
        policy = policy / np.sum(policy)

        return value, policy


value_policy_model = ValuePolicyModel()


if __name__ == '__main__':
    # RUN TO GENERATE NEW MODEL TO TRAIN ON
    value_policy_model.set_name("delete_this")
    value_policy_model.save("0")
