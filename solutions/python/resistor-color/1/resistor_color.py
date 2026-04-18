from enum import IntEnum, auto


class Color(IntEnum):
    black = 0
    brown = auto()
    red = auto()
    orange = auto()
    yellow = auto()
    green = auto()
    blue = auto()
    violet = auto()
    grey = auto()
    white = auto()


def color_code(color: str) -> int:
    return Color[color].value


def colors() -> list[str]:
    return [c.name for c in Color]
