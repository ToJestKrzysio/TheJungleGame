from board import BoardConfig


class Unit:

    def __init__(self, x, y, value):
        self.x = x
        self.y = y
        self.value = value
        self.max_x, self.max_y = BoardConfig.shape
        self.moves = list(self.get_moves())

    def get_moves(self):
        for move in (-1, 1):
            if 0 <= self.y + move <= self.max_y:
                yield self.x + move, self.y
            if 0 <= self.y + move <= self.max_y:
                yield self.x, self.y + move

    def move(self, x, y):
        if (x, y) in self.moves:
            self.x = x
            self.y = y
            self.moves = list(self.get_moves())
        else:
            raise ValueError

    def __repr__(self):
        return f"Unit of value {self.value} at ({self.x}, {self.y})\nPossible moves: {self.moves}"


