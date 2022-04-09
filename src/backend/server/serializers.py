import json
from typing import List

from game import Board, Cell, Position


def serialize_cell(cell: "Cell") -> dict:
    """
    Converts cell into a dictionary object.

    :param cell: Cell instance to be serialized.

    :return: Dictionary of the following format
        {
            unit_value: int,
            unit_white: bool,
            white_trap: bool,
            black_trap: bool,
            water: bool
        }
    """
    return {
        "unit": {
            "white": cell.occupant.white,
            "value": cell.occupant.value,
            "moves": [],
        },
        "white_trap": cell.trap and cell.white_trap,
        "black_trap": cell.trap and not cell.white_trap,
        "water": cell.water
    }


def serialize_board(board: Board) -> List[List[dict]]:
    """
    Serializes board object into JSON format.

    :param board: Board instance which will be serialized.

    :return: List of lists of the same shape as board, with serialized representations of Cells.
    """
    rows, cols = board.shape
    cells = []
    for y in range(rows):
        new_row = []
        for x in range(cols):
            position = Position(x=x, y=y)

            serialized_cell = serialize_cell(board[position])

            if serialized_cell["unit"]["value"] not in {0, 1}:
                serialized_cell["unit"]["moves"] = [
                    board.get_new_position(position, move)._asdict() for move in
                    board.get_single_unit_moves(position)
                ]

            new_row.append(serialized_cell)
        cells.append(new_row)
    return cells


if __name__ == '__main__':
    board = Board.initialize()
    result = serialize_board(board)
    print(result)
    t = 42
