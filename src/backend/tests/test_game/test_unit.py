from unittest.mock import Mock

import pytest

from game import Unit


class TestUnit:

    @pytest.mark.parametrize("value", range(-9, 10))
    def test_bool(self, value):
        unit_double = Mock(value=value)
        assert Unit.__bool__(unit_double) == bool(value)
