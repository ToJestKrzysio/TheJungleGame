from src.game_engine.properties import GroundStates, water_types, Units
from src.game_engine.exceptions import JumpIntoWaterError


class Cell:

    __slots__ = ["land", "water", "trap", "occupied", "ground_value", "_occupant"]

    land: bool
    water: bool
    trap: bool
    occupied: bool
    occupant: int
    ground_value: int

    def __init__(
            self,
            occupant: int = 0,
            water: bool = False,
            trap: bool = False
    ):
        """ Initializes instance of a Cell. """
        self.land, self.water, self.trap, self.ground_value = type(self).init_ground(water, trap)
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
    def occupant(self) -> int:
        """ Returns occupant of the current cell. """
        return self._occupant

    @occupant.setter
    def occupant(self, occupant: int) -> None:
        """ Assigns new occupant to a cell and changes its occupancy. """
        if self.water and abs(occupant) not in water_types:
            raise JumpIntoWaterError(f"Unit {Units(abs(occupant))} cannot enter water.")
        self.occupied = bool(occupant)
        self._occupant = occupant

    def get_cell_state(self) -> tuple[int, int]:
        """ Returns tuple representing cell occupant and cell ground value. """
        return self.occupant, self.ground_value

    def __repr__(self):
        return f"{type(self).__name__}(occupant={self.occupant}, water={self.water}, trap={self.trap})"
