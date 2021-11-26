class JumpIntoWaterError(Exception):
    """ Selected unit cannot be in the water. """
    pass


class MoveNotPossibleError(Exception):
    """ Selected move location is not a valid target. """
    pass
