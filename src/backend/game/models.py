import logging
import os
import random
from abc import ABC, abstractmethod
from typing import Tuple, TYPE_CHECKING, Optional, List

import numpy as np
from tensorflow.keras import regularizers, optimizers, layers, Model
from tensorflow.keras.models import load_model

from game.a_star import AStar
from game import Position, get_move_by_values

if TYPE_CHECKING:
    from game import Board, BoardTensor, Unit


class AbstractModel(ABC):
    model: Model
    name: str

    def __init__(self, **kwargs):
        self.name = ""

    @abstractmethod
    def predict(self, tensor: "BoardTensor", mask: np.array) -> Tuple[float, np.ndarray]:
        pass

    @abstractmethod
    def set_name(self, name: str) -> None:
        pass

    @abstractmethod
    def load(self, filename: str) -> None:
        pass

    @abstractmethod
    def load_checkpoint(self, filepath: str) -> None:
        pass

    @abstractmethod
    def save(self, filename: str) -> None:
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
        self.input_shape = (9, 7, 24)
        self.output_shape = (9, 7, 8)
        self.conv_blocks = kwargs.get("CONVOLUTIONAL_BLOCKS", 6)
        self.model = self._create_model()
        self.base_dir = kwargs.get("BASE_DIR", "../data/models")

        self._cache = {}

    def _create_model(self) -> Model:
        model_input = layers.Input(shape=self.input_shape)
        input_layer = model_input
        for layer_id in range(self.conv_blocks):
            input_layer = self._get_conv_block(input_layer, layer_id)
        final_conv_layer = input_layer
        policy_head = self._get_policy_head(final_conv_layer)
        value_head = self._get_value_head(final_conv_layer)

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

    def set_name(self, name: str) -> None:
        self.name = name

    def load(self, filename: int = -1) -> int:
        self._cache.clear()

        load_dir = os.path.join(self.base_dir, self.name)
        if filename == -1:
            filename = max(os.listdir(load_dir))

        filepath = os.path.join(load_dir, str(filename))
        self.model = load_model(filepath)
        logging.info(f"Loaded karas model from '{filepath}'")
        return int(filename)

    def load_checkpoint(self, filepath: str) -> None:
        self._cache.clear()
        self.model = load_model(filepath)
        logging.info(f"Loaded karas checkpoint data from '{filepath}'")

    def save(self, filename: str) -> None:
        filepath = os.path.join(self.base_dir, self.name, filename)
        self.model.save(filepath)
        logging.info(f"Saved karas model to '{filepath}'")

    def _get_conv_block(self, input_layer: layers.Layer, layer_id: int) -> layers.Layer:
        conv_layer = layers.Conv2D(filters=self.num_filters, kernel_size=(3, 3), padding="same",
                                   activation="relu", use_bias=True, data_format="channels_last",
                                   kernel_regularizer=self.conv_kernel_reg,
                                   bias_regularizer=self.conv_bias_reg,
                                   name=f"Convolutional_Layer_{layer_id}")(input_layer)
        batch_norm = layers.BatchNormalization(
            axis=-1, name=f"Batch_Normalization_{layer_id}")(conv_layer)
        return batch_norm

    def _get_policy_head(self, input_layer: layers.Layer) -> layers.Layer:
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

    def _get_value_head(self, input_layer: layers.Layer) -> layers.Layer:
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

        :return: Tuple of predicted [value, normalised_probabilities].
        """
        if tensor.shape == self.input_shape:
            tensor = np.expand_dims(tensor, axis=0)

        value, policy = self._get_prediction(tensor)

        value = value[0][0]

        policy = policy.reshape(self.output_shape)
        policy *= mask
        policy = policy / np.sum(policy)

        return value, policy

    def _get_prediction(self, tensor) -> Tuple[float, np.ndarray]:
        """
        Cached version of Keras.model.predict.

        :param tensor: Array representing current and previous board states.

        :return: Tuple of predicted [value, probabilities].
        """
        tensor_key = tensor.data.tobytes()
        if tensor_key not in self._cache:
            self._cache[tensor_key] = self.model.predict(tensor)
            if len(self._cache) > 2000:
                key = next(iter(self._cache))
                del self._cache[key]

        return self._cache[tensor_key]


class AStarModel:
    units: Optional[List["Unit"]]

    def __init__(self):
        super().__init__()
        self.units = None

    def _get_unit(self, board: "Board") -> "Unit":
        for unit in self.units:
            if unit in board.positions.keys():
                return unit

    def predict(self, board: "Board") -> Tuple[float, np.array]:
        if self.units is None:
            units = [unit for unit in board.positions.keys() if unit.white is board.white_move]
            self.units = [unit for unit in units if unit.value > 1]
            random.shuffle(self.units)

        unit = self._get_unit(board)
        search = AStar(board, unit, Position(8, 3))
        path = search()
        move_pos = path[1].board.positions[unit] - board.positions[unit]
        move = get_move_by_values(y=move_pos.y, x=move_pos.x)
        new_position = board.positions[unit] + move

        policy = np.zeros(shape=(9, 7, 8), dtype=float)
        policy[new_position.y, new_position.x, move.value] = 1

        whites = len([unit for unit in board.positions if unit.white is board.white_move])
        blacks = len(board.positions) - whites
        value = (whites - blacks) / 8 if board.white_move else (blacks - whites) / 8
        return value, policy

    def set_name(self, name: str) -> None:
        pass

    def load(self, filename: str) -> None:
        pass

    def load_checkpoint(self, filepath: str) -> None:
        pass

    def save(self, filename: str) -> None:
        pass


if __name__ == '__main__':
    # RUN TO GENERATE NEW MODEL TO TRAIN ON
    name = "rsm_3"
    kwargs = {"BASE_DIR": "../data/models"}
    model = ValuePolicyModel(**kwargs)
    model.set_name(name)
    model.save("0")
