def equilateral(sides: list[int]) -> bool:
    a, b, c = sides
    return triangle_inequality(sides) and a == b and b == c


def isosceles(sides: list[int]) -> bool:
    a, b, c = sides
    return triangle_inequality(sides) and (a == b or b == c or c == a)


def scalene(sides: list[int]) -> bool:
    a, b, c = sides
    return triangle_inequality(sides) and not (a == b or b == c or c == a)


def triangle_inequality(sides: list[int]) -> bool:
    a, b, c = sorted(sides)
    return a + b > c
