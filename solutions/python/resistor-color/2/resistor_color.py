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


def color_code(color: str) -> int:
    return Color[color.upper()].value


def colors() -> list[str]:
    return [c.name.lower() for c in Color]
