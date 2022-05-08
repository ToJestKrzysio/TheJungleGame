__all__ = [
    "Unit", "Units", "Den", "get_unit",
    "EMPTY", "WHITE_DEN", "BLACK_DEN",
    "WHITE_MOUSE", "WHITE_CAT", "WHITE_DOG", "WHITE_WOLF", "WHITE_LEOPARD", "WHITE_TIGER",
    "WHITE_LION", "WHITE_ELEPHANT",
    "BLACK_MOUSE", "BLACK_CAT", "BLACK_DOG", "BLACK_WOLF", "BLACK_LEOPARD", "BLACK_TIGER",
    "BLACK_LION", "BLACK_ELEPHANT",
]

from enum import Enum
from dataclasses import dataclass


class Units(Enum):
    EMPTY = 0
    DEN = 1
    MOUSE = 2
    CAT = 3
    DOG = 4
    WOLF = 5
    LEOPARD = 6
    TIGER = 7
    LION = 8
    ELEPHANT = 9


@dataclass(frozen=True, repr=False)
class Unit:
    white: bool
    value: int
    captures_land: frozenset = frozenset()
    captures_water: frozenset = frozenset()
    captures_mixed: frozenset = frozenset()
    jumps: bool = False
    swims: bool = False

    def __bool__(self):
        return bool(self.value)

    def __repr__(self):
        return (
            f"{'White' if self.white else 'Black'} {self.__class__.__name__}"
        )


@dataclass(frozen=True, repr=False)
class Empty(Unit):
    white: bool = False
    value: int = Units.EMPTY.value
    swims: bool = True

    def __repr__(self):
        return f"Empty"


@dataclass(frozen=True, repr=False)
class Den(Unit):
    value: int = Units.DEN.value


@dataclass(frozen=True, repr=False)
class Mouse(Unit):
    value: int = Units.MOUSE.value
    swims: bool = True
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.ELEPHANT.value]
    )
    captures_water: frozenset = frozenset(
        [Units.EMPTY.value, Units.MOUSE.value]
    )
    captures_mixed: frozenset = frozenset(
        [Units.EMPTY.value]
    )


@dataclass(frozen=True, repr=False)
class Cat(Unit):
    value: int = Units.CAT.value
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value]
    )


@dataclass(frozen=True, repr=False)
class Dog(Unit):
    value: int = Units.DOG.value
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value, Units.DOG.value]
    )


@dataclass(frozen=True, repr=False)
class Wolf(Unit):
    value: int = Units.WOLF.value
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value, Units.DOG.value, Units.WOLF.value]
    )


@dataclass(frozen=True, repr=False)
class Leopard(Unit):
    value: int = Units.LEOPARD.value
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value, Units.DOG.value, Units.WOLF.value,
         Units.LEOPARD.value]
    )


@dataclass(frozen=True, repr=False)
class Tiger(Unit):
    value: int = Units.TIGER.value
    jumps: bool = True
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value, Units.DOG.value, Units.WOLF.value,
         Units.LEOPARD.value, Units.TIGER.value]
    )


@dataclass(frozen=True, repr=False)
class Lion(Unit):
    value: int = Units.LION.value
    jumps: bool = True
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.MOUSE.value,
         Units.CAT.value, Units.DOG.value, Units.WOLF.value,
         Units.LEOPARD.value, Units.TIGER.value, Units.LION.value]
    )


@dataclass(frozen=True, repr=False)
class Elephant(Unit):
    value: int = Units.ELEPHANT.value
    captures_land: frozenset = frozenset(
        [Units.EMPTY.value, Units.DEN.value, Units.CAT.value,
         Units.DOG.value, Units.WOLF.value, Units.LEOPARD.value,
         Units.TIGER.value, Units.LION.value, Units.ELEPHANT.value]
    )


EMPTY = Empty()

WHITE_DEN = Den(True)
WHITE_MOUSE = Mouse(True)
WHITE_CAT = Cat(True)
WHITE_DOG = Dog(True)
WHITE_WOLF = Wolf(True)
WHITE_LEOPARD = Leopard(True)
WHITE_TIGER = Tiger(True)
WHITE_LION = Lion(True)
WHITE_ELEPHANT = Elephant(True)

BLACK_DEN = Den(False)
BLACK_MOUSE = Mouse(False)
BLACK_CAT = Cat(False)
BLACK_DOG = Dog(False)
BLACK_WOLF = Wolf(False)
BLACK_LEOPARD = Leopard(False)
BLACK_TIGER = Tiger(False)
BLACK_LION = Lion(False)
BLACK_ELEPHANT = Elephant(False)


def get_unit(value: int, white: bool) -> Unit:
    """
    Returns unit instance associated with given value and color.

    :param value: Value associated to the given unit.
    :param white: Boolean value, unit color.

    :return: Proper unit instance.
    """
    units = {
        (1, False): BLACK_DEN,
        (2, False): BLACK_MOUSE,
        (3, False): BLACK_CAT,
        (4, False): BLACK_DOG,
        (5, False): BLACK_WOLF,
        (6, False): BLACK_LEOPARD,
        (7, False): BLACK_TIGER,
        (8, False): BLACK_LION,
        (9, False): BLACK_ELEPHANT,

        (1, True): WHITE_DEN,
        (2, True): WHITE_MOUSE,
        (3, True): WHITE_CAT,
        (4, True): WHITE_DOG,
        (5, True): WHITE_WOLF,
        (6, True): WHITE_LEOPARD,
        (7, True): WHITE_TIGER,
        (8, True): WHITE_LION,
        (9, True): WHITE_ELEPHANT,
    }
    return units.get((value, white), EMPTY)
