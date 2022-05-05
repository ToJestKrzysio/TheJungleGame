import os
from typing import Tuple


def get_model_versions(model_name: str) -> Tuple[int, ...]:
    versions = os.listdir(f"./data/models/{model_name}")
    return tuple(sorted((int(version) for version in versions), reverse=True))
