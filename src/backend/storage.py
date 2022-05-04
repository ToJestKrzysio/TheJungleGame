import json
from typing import Any

from game import Board


class Storage:

    def __init__(self, filename: str = "storage.json"):
        """
        Set up the source filename.

        :param filename: Origin file name.
        """
        self.filename = filename
        with open(self.filename) as file_:
            self.data = json.load(file_)

    def save(self) -> None:
        """
        Save current state of self.data to storage file.

        :return: None.
        """
        with open(self.filename) as file_:
            json.dump(self.data, file_)

    def set_board(self, board: Board) -> None:
        """
        Set self.data["state"] to provided value and save to storage.

        :param board: Current board state.

        :return: None.
        """
        self.data["board"] = board
        self.save()

    def __getitem__(self, key: str) -> Any:
        """
        Retrieve data associated with the given key from storage.

        :param key: Key used to retrieve the data.

        :return: Data associated with the given key.
        """
        return self.data[key]

    def __setitem__(self, key: str, value: Any) -> None:
        """
        Set new value to the given key in the storage.

        :param key: Key used to retrieve the data.
        :param value: Data which should be assigned to the given key.

        :return: None
        """
        self.data[key] = value
