class _EvaluationsCounter(object):

    def __init__(self):
        self.evaluations = 0
        self.max_evaluations = 0

    def __iadd__(self, other):
        if not isinstance(other, int):
            raise NotImplementedError
        self.evaluations += other
        return self

    def __str__(self):
        return f'EvaluationsCounter {self.evaluations+1}/{self.max_evaluations}'

    def set_max_evaluations(self, max_evaluations: int) -> None:
        """
        Sets number of max evaluations for the counter.

        :param max_evaluations: Number of evaluations after which counter will inform about
                                completion.
        :return: None.
        """
        self.max_evaluations = max_evaluations

    def over(self) -> bool:
        """
        Returns if counting should continue or not.

        :return: True if maximum number of evaluations was reached False otherwise.
        """
        return self.evaluations >= self.max_evaluations

    def reset(self) -> None:
        """
        Resets evaluations to 0, to restart the counter.

        :return: None.
        """
        self.evaluations = 0


evaluations_counter = _EvaluationsCounter()
