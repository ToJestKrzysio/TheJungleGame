from unittest.mock import Mock, patch

import numpy as np

from game.models import ValuePolicyModel


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

    get_prediction_mock = Mock(return_value=(value, policy_tensor))
    network_mock = Mock(spec=ValuePolicyModel, output_shape=(9, 7, 8),
                        input_shape=(9, 7, 178), _get_prediction=get_prediction_mock)

    result_value, result_policy = ValuePolicyModel.predict(
        self=network_mock, tensor=tensor_mock, mask=mask)

    get_prediction_mock.assert_called_once_with(tensor_mock)

    expected_value = 0.7

    expected_policy = np.zeros((9, 7, 8))
    expected_policy[1, 2, 3] = 0.5
    expected_policy[6, 6, 6] = 0.5

    assert isinstance(result_value, float)
    assert result_value == expected_value

    assert np.array_equal(result_policy, expected_policy)
