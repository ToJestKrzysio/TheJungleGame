from tensorflow.keras import regularizers, optimizers, layers, Model


class ValuePolicyNetwork:

    def __init__(self, **kwargs):
        self.conv_kernel_reg = regularizers.l2(
            kwargs.get("CONVOLUTIONAL_KERNEL_REGULARIZATION", 0.01))
        self.conv_bias_reg = regularizers.l2(
            kwargs.get("CONVOLUTIONAL_BIAS_REGULARIZATION", self.conv_kernel_reg))

        self.dense_kernel_reg = regularizers.l2(
            kwargs.get("DENSE_KERNEL_REGULARIZATION", 0.01))
        self.dense_bias_reg = regularizers.l2(
            kwargs.get("DENSE_BIAS_REGULARIZATION", self.dense_kernel_reg))

        self.num_filters = kwargs.get("NUMBER_OF_FILTERS", 12)
        self.policy_loss_weight = kwargs.get("POLICY_LOSS_WEIGHT", 0.01)
        self.value_loss_weight = kwargs.get("VALUE_LOSS_WEIGHT", 0.01)
        self.input_shape = kwargs.get("INPUT_SHAPE", (9, 7, 178))
        self.conv_blocks = kwargs.get("CONVOLUTIONAL_BLOCKS", 6)
        self._model = None

    @classmethod
    def get_model(cls, **kwargs):
        network = ValuePolicyNetwork(**kwargs)
        return network.model

    def create_model(self):
        model_input = layers.Input(shape=self.input_shape)
        input_layer = model_input
        for layer_id in range(self.conv_blocks):
            input_layer = self.get_conv_block(input_layer, layer_id)
        final_conv_layer = input_layer
        policy_head = self.get_value_head(final_conv_layer)
        value_head = self.get_policy_head(final_conv_layer)

        model = Model(model_input, [policy_head, value_head])
        model.compile(
            loss={
                "policy_head": "categorical_crossentropy",
                "value_head": "mse"
            },
            loss_weights={
                "policy_head": self.policy_loss_weight,
                "value_head": self.value_loss_weight
            },
            optimizer=optimizers.Adam()
        )
        return model

    @property
    def model(self):
        if self._model is None:
            self._model = self.create_model()
        return self._model

    def get_conv_block(self, input_layer: layers.Layer, layer_id: int) -> layers.Layer:
        conv_layer = layers.Conv2D(filters=self.num_filters, kernel_size=(3, 3), padding="same",
                                   activation="relu", use_bias=True, data_format="channels_last",
                                   kernel_regularizer=self.conv_kernel_reg,
                                   bias_regularizer=self.conv_bias_reg,
                                   name=f"Convolutional Layer {layer_id}")(input_layer)
        batch_norm = layers.BatchNormalization(
            axis=-1, name=f"Batch Normalization {layer_id}")(conv_layer)
        return batch_norm

    def get_policy_head(self, input_layer: layers.Layer):
        conv_layer_1 = layers.Conv2D(
            filters=self.num_filters, kernel_size=(3, 3), padding="same", activation="relu",
            use_bias=True, data_format="channel_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Policy Convolutional Layer 1")(input_layer)
        batch_norm_1 = layers.BatchNormalization(
            axis=-1, name="Policy Batch Normalization 1")(conv_layer_1)
        conv_layer_2 = layers.Conv2D(
            filters=self.input_shape[0:2], kernel_size=(1, 1), padding="same", activation="relu",
            use_bias=True, data_format="channel_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Policy Convolutional Layer 2")(batch_norm_1)
        batch_norm_2 = layers.BatchNormalization(
            axis=-1, name="Policy Batch Normalization 1")(conv_layer_2)
        flatten_layer = layers.Flatten(name="Policy Flatten Layer")(batch_norm_2)
        output_layer = layers.Dense(
            512, activation='softmax', use_bias=True, kernel_regularizer=self.dense_kernel_reg,
            bias_regularizer=self.dense_kernel_reg, name='Policy Head')(flatten_layer)
        return output_layer

    def get_value_head(self, input_layer: layers.Layer):
        conv_layer = layers.Conv2D(
            filters=1, kernel_size=(1, 1), padding="same", activation="relu", use_bias=True,
            data_format="channels_last", kernel_regularizer=self.conv_kernel_reg,
            bias_regularizer=self.conv_bias_reg, name="Value Convolutional Layer")(input_layer)
        batch_norm_1 = layers.BatchNormalization(
            axis=-1, name="Value Batch Normalization 1")(conv_layer)
        flatten_layer = layers.Flatten(name="Value Flatten Layer")(batch_norm_1)
        dense_layer = layers.Dense(
            64, activation="relu", use_bias=True, kernel_regularizer=self.dense_kernel_reg,
            bias_regularizer=self.dense_bias_reg, name="Value Dense Layer")(flatten_layer)
        batch_norm_2 = layers.BatchNormalization(
            axis=-1, name="Value Batch Normalization 2")(dense_layer)
        output_layer = layers.Dense(
            1, activation="tanh", use_bias=True, kernel_regularizer=self.dense_kernel_reg,
            bias_regularizer=self.dense_bias_reg, name="Value Head")(batch_norm_2)
        return output_layer
