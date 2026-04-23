from enum import IntEnum, auto


class Color(IntEnum):
    BLACK = 0
    BROWN = auto()
    RED = auto()
    ORANGE = auto()
    YELLOW = auto()
    GREEN = auto()
    BLUE = auto()
    VIOLET = auto()
    GREY = auto()
    WHITE = auto()


def value(colors: list[str]) -> int:
    c1, c2, *_ = colors
    return int(f"{Color[c1.upper()].value}{Color[c2.upper()].value}")
