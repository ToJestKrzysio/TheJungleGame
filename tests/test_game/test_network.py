from unittest.mock import Mock

import numpy as np
from keras import regularizers

from game.network import ValuePolicyNetwork


def test_init():
    network_mock = Mock()

    ValuePolicyNetwork.__init__(network_mock)

    assert isinstance(network_mock.conv_kernel_reg, regularizers.Regularizer)
    assert isinstance(network_mock.conv_bias_reg, regularizers.Regularizer)

    assert isinstance(network_mock.dense_kernel_reg, regularizers.Regularizer)
    assert isinstance(network_mock.dense_bias_reg, regularizers.Regularizer)

    assert network_mock.num_filters == 12
    assert network_mock.policy_loss_weight == 0.01
    assert network_mock.value_loss_weight == 0.01
    assert network_mock.input_shape == (9, 7, 178)
    assert network_mock.conv_blocks == 6

    network_mock.create_model.assert_called_once()


def test_predict():
    mask = np.zeros((9, 7, 8), dtype=bool)
    mask[1, 2, 3] = 1
    mask[6, 6, 6] = 1

    tensor_mock = Mock()

    policy_tensor = np.zeros((9, 7, 8), dtype=float)
    policy_tensor[0, 0, 0] = 10
    policy_tensor[1, 2, 3] = 100
    policy_tensor[6, 6, 6] = 100
    policy_tensor = policy_tensor.reshape(-1)

    value = np.array([[0.7]], dtype=float)

    model_mock = Mock()
    model_mock.predict.return_value = (value, policy_tensor)
    network_mock = Mock(spec=ValuePolicyNetwork, model=model_mock, output_shape=(9, 7, 8))

    result_value, result_policy = ValuePolicyNetwork.predict(self=network_mock, tensor=tensor_mock,
                                                             mask=mask)

    model_mock.predict.assert_called_once_with(tensor_mock)

    expected_value = 0.7

    expected_policy = np.zeros((9, 7, 8))
    expected_policy[1, 2, 3] = 0.5
    expected_policy[6, 6, 6] = 0.5

    assert isinstance(result_value, float)
    assert result_value == expected_value

    assert np.array_equal(result_policy, expected_policy)
