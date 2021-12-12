from tensorflow.python.keras import Sequential, layers
from numpy import load

x = load("tensor.npy").reshape((1, 9, 7, 178))
FILTERS = 128
INPUT_SHAPE = 9, 7, 178


def get_policy_head(filters: int) -> Sequential:
    policy_layer = Sequential()
    policy_layer.add(layers.InputLayer(input_shape=(9, 7, filters)))
    policy_layer.add(
        layers.Conv2D(filters=10, strides=1, kernel_size=(1, 1), activation="softmax"))
    return policy_layer


def get_value_head(filters: int) -> Sequential:
    value_layer = Sequential()
    value_layer.add(layers.InputLayer(input_shape=(9, 7, filters)))
    value_layer.add(
        layers.Conv2D(filters=1, strides=1, kernel_size=(1, 1), activation="relu"))
    value_layer.add(layers.Dense(units=256, activation="linear"))
    value_layer.add(layers.Dense(units=1, activation="tanh"))
    return value_layer


def get_base_network(filters: int) -> Sequential:
    initial_layer = Sequential()
    initial_layer.add(layers.InputLayer(input_shape=INPUT_SHAPE))
    initial_layer.add(layers.ZeroPadding2D(padding=2, data_format="channels_last"))
    initial_layer.add(
        layers.Conv2D(filters=filters, strides=1, kernel_size=(5, 5), activation="relu"))

    conv_1_layer = Sequential()
    conv_1_layer.add(layers.ZeroPadding2D(padding=1, data_format="channels_last"))
    initial_layer.add(
        layers.Conv2D(filters=filters, strides=1, kernel_size=(3, 3), activation="relu"))

    base_network = Sequential([initial_layer])
    for idx in range(11):
        base_network.add(conv_1_layer)

    return base_network


base_network = get_base_network(filters=FILTERS)
value_network = get_value_head(filters=FILTERS)
policy_network = get_policy_head(filters=FILTERS)

y = base_network(x)
value = value_network(y)
policy = policy_network(y)

print(y.shape)
print(value.shape)
print(policy.shape)
