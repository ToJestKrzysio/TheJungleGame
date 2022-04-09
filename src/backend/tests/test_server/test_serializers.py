from unittest.mock import Mock, MagicMock, patch

from server.serializers import serialize_cell, serialize_board

PATH = f"server.serializers"


def test_serialize_cell():
    occupant_mock = Mock(value=42, white=True)
    cell_mock = Mock(occupant=occupant_mock, trap=True, white_trap=True, water=True)

    result = serialize_cell(cell_mock)

    assert list(result.keys()) == ["unit", "white_trap", "black_trap", "water"]
    assert list(result["unit"].keys()) == ["white", "value", "moves"]


@patch(f"{PATH}.serialize_cell")
def test_serialize_board(serialize_cell_patch):
    cells = [[Mock()], [Mock(), Mock()]]
    serialized_cell = {
        "unit": {
            "white": True,
            "value": 1,
            "moves": [],
        },
        "white_trap": False,
        "black_trap": False,
        "water": False,
    }

    board_mock = MagicMock()
    board_mock.__iter__.return_value = cells

    serialize_cell_patch.return_value = serialized_cell

    result = serialize_board(board_mock)

    expected = [[serialized_cell], [serialized_cell, serialized_cell]]
    assert result == expected
