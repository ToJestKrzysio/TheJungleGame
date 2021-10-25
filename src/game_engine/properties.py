import enum
from enum import Enum


class GroundStates(Enum):
    LAND = 1
    WATER = 2
    TRAP = 3


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


enters_water = {Units.EMPTY.value, Units.MOUSE.value, }
jumps_over_water = {Units.TIGER.value, Units.LION.value, }
no_water_interaction = {Units.CAT.value, Units.DOG.value, Units.WOLF.value, Units.LEOPARD.value, Units.ELEPHANT.value}
