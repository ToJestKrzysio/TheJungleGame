from src.game_engine.properties import GroundStates, Units
from src.game_engine.exceptions import JumpIntoWaterError
from src.game_engine.unit import Unit, Empty


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
            occupant: Unit,
            water: bool = False,
            trap: bool = False,
            white_trap: bool = True
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

    def get_cell_state(self) -> tuple[int, int]:
        """ Returns tuple representing cell occupant and cell ground value. """
        return self.occupant.value, self.ground_value

    def __repr__(self):
        return (f"{type(self).__name__}(occupant={self.occupant}, "
                f"water={self.water}, trap={self.trap})")

    def __bool__(self):
        return self.occupied

    def can_capture(self, other):
        if self.water:
            if other.water:
                return other.occupant.value in self.occupant.captures_water
            return other.occupant.value in self.occupant.captures_mixed
        if other.trap:
            if (other.white_trap == other.occupant.white and
                    not isinstance(other.occupant, Empty)):
                return False
            return True
        if other.water:
            return other.occupant.value in self.occupant.captures_mixed
        return other.occupant.value in self.occupant.captures_land
