from abc import ABC


class Cell(ABC):
    value: int
    position: tuple[int, int]

    def __repr__(self):
        return f"{self.__name__}(x={self.position[0]}, y={self.position[1]}, value={self.value})"

