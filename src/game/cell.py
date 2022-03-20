from __future__ import annotations

from enum import Enum
from typing import Tuple

from src.game import EMPTY, JumpIntoWaterError, Unit, Units, Den


class GroundStates(Enum):
    LAND = 1
    WATER = 2
    TRAP = 3


class Cell:
    __slots__ = ["land", "water", "trap", "occupied", "ground_value",
                 "_occupant", "white_trap"]

    land: bool
    water: bool
    trap: bool
    white_trap: bool
    occupied: bool
    occupant: Unit
    ground_value: int

    def __init__(
            self,
            occupant: Unit = EMPTY,
            water: bool = False,
            trap: bool = False,
            white_trap: bool = False
    ):
        """ Initializes instance of a Cell. """
        self.land, self.water, self.trap, self.ground_value = self.init_ground(
            water, trap)
        self.white_trap = white_trap
        self.occupant = occupant

    @staticmethod
    def init_ground(water, trap):
        """ Returns states of the ground and its value. """
        if water:
            return False, True, False, GroundStates.WATER.value
        if trap:
            return True, False, True, GroundStates.TRAP.value
        else:
            return True, False, False, GroundStates.LAND.value

    @property
    def occupant(self) -> Unit:
        """ Returns occupant of the current cell. """
        return self._occupant

    @occupant.setter
    def occupant(self, occupant: Unit) -> None:
        """ Assigns new occupant to a cell and changes its occupancy. """
        if self.water and not occupant.swims:
            raise JumpIntoWaterError(
                f"Unit '{Units(abs(occupant.value))}' cannot enter water.")
        self.occupied = bool(occupant)
        self._occupant = occupant

    def get_cell_state(self) -> Tuple[int, int]:
        """ Returns tuple representing cell occupant and cell ground value. """
        return self.occupant.value, self.ground_value

    # def __repr__(self):
    #     return (f"{type(self).__name__}(occupant={self.occupant}, "
    #             f"water={self.water}, trap={self.trap}")

    def __str__(self):
        return f"Cell({repr(self.occupant)}),"

    def __repr__(self):
        if self.occupant is EMPTY:
            sign = " "
        else:
            sign = "+" if self.occupant.white else "-"
        return f"{sign}{repr(self.occupant.value)}"

    def __bool__(self):
        return self.occupied

    def can_capture(self, other: Cell):
        """
        Checks is occupant of the current cell can capture the other.

        :param other: Cell instance.

        :return: True if cell can be captured otherwise False
        """
        if other and other.occupant.white == self.occupant.white:
            return False
        if self.water:
            if other.water:
                return other.occupant.value in self.occupant.captures_water
            return other.occupant.value in self.occupant.captures_mixed
        if other.trap:
            return not (
                    isinstance(self.occupant, Den) or
                    (other.white_trap == other.occupant.white and other.occupant is not EMPTY)
            )
        if other.water:
            return other.occupant.value in self.occupant.captures_mixed
        return other.occupant.value in self.occupant.captures_land
