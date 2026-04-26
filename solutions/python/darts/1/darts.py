import math


def score(x: int, y: int) -> int:
    euclidean_distance = math.hypot(x, y)
    if euclidean_distance <= 1:
        return 10
    if euclidean_distance <= 5:
        return 5
    if euclidean_distance <= 10:
        return 1
    return 0
