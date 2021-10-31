from dataclasses import dataclass
from src.game_engine.properties import Units


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
    captures_from_water: frozenset = frozenset(
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



