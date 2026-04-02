def leap_year(year: int) -> bool:
    divisible_by4 = year % 4 == 0
    divisible_by100 = year % 100 == 0
    divisible_by400 = year % 400 == 0

    return divisible_by400 or (divisible_by4 and not divisible_by100)
