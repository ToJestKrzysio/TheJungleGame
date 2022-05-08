import json
import logging
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
        self._board = None
        self.root = None

    @property
    def board(self) -> Board:
        """
        Return current state of self._board.

        :return: Board.
        """
        return self._board

    @board.setter
    def board(self, board: Board) -> None:
        """
        Update board and it's corresponding state.

        :param board: State to which self._board and state will be set.

        :return: None.
        """
        self._board = board
        self["state"] = board.serializer.dump(board)
        self.save()

    def load_model(self) -> None:
        """
        Set self.board.model to selected version.

        :return: None
        """
        name = self["model"]
        version = self["version"]
        self.board.model.set_name(name)
        self.board.model.load(version)
        logging.debug(f"Loaded model '{name}' version {version}.")

    def save(self) -> None:
        """
        Save current state of self.data to storage file.

        :return: None.
        """
        with open(self.filename, "w+") as file_:
            json.dump(self.data, file_)

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
        self.save()
