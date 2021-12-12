from tensorflow.python.keras import Sequential, layers
from numpy import load

x = load("tensor.npy").reshape((1, 9, 7, 178))
FILTERS = 128
INPUT_SHAPE = 9, 7, 178


def get_policy_head():
    policy_network = Sequential([initial_layer])
    for idx in range(11):
        policy_network.add(conv_1_layer)
    policy_network.add(final_policy_layer)

    return policy_network


def get_base_network(filters: int):
    initial_layer = Sequential()
    initial_layer.add(layers.InputLayer(input_shape=INPUT_SHAPE))
    initial_layer.add(layers.ZeroPadding2D(padding=2, data_format="channels_last"))
    initial_layer.add(
        layers.Conv2D(filters=filters, strides=1, kernel_size=(5, 5), activation="relu"))

    conv_1_layer = Sequential()
    conv_1_layer.add(layers.ZeroPadding2D(padding=1, data_format="channels_last"))
    initial_layer.add(
        layers.Conv2D(filters=filters, strides=1, kernel_size=(3, 3), activation="relu"))

    final_value_layer = Sequential()
    final_value_layer.add(
        layers.Conv2D(filters=10, strides=1, kernel_size=(1, 1), activation="softmax"))

    base_network = Sequential([initial_layer])
    for idx in range(11):
        base_network.add(conv_1_layer)

    return base_network


policy_network = get_policy_network(FILTERS)
y = policy_network(x)
print(y.shape)
