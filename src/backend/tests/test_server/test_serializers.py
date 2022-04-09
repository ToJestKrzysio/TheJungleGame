from unittest.mock import Mock, MagicMock


def test_serialize_board():
    cells = [[Mock(), Mock(), Mock(), ], [Mock(), Mock(), ], [Mock(), ]]
    board_mock = Mock(return_value=cells)
