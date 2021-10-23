import enum
from enum import Enum


# class EnumContains(enum.EnumMeta):
#     def __contains__(cls, item):
#         try:
#             cls(item)
#         except ValueError:
#             return False
#         return True


class GroundStates(Enum):
    LAND = 1
    WATER = 2
    TRAP = 3


class Units(Enum):
    DEN = 1
    MOUSE = 2
    CAT = 3
    DOG = 4
    WOLF = 5
    LEOPARD = 6
    TIGER = 7
    LION = 8
    ELEPHANT = 9


# class WaterTypes(Enum, metaclass=EnumContains):
#     MOUSE = Units.MOUSE.value




