"""Functions to prevent a nuclear meltdown."""

# Using only one StrEnum or Literal should be better to stay coherent, but I wanted to try both of them
from enum import StrEnum
from typing import Literal


class Bands(StrEnum):
    GREEN = "green"
    ORANGE = "orange"
    RED = "red"
    BLACK = "black"


def is_criticality_balanced(
    temperature: int | float, neutrons_emitted: int | float
) -> bool:
    """Verify criticality is balanced.

    :param temperature: int or float - temperature value in kelvin.
    :param neutrons_emitted: int or float - number of neutrons emitted per second.
    :return: bool - is criticality balanced?

    A reactor is said to be balanced in criticality if it satisfies the following conditions:
    - The temperature is less than 800 K.
    - The number of neutrons emitted per second is greater than 500.
    - The product of temperature and neutrons emitted per second is less than 500000.
    """

    return (
        temperature < 800
        and neutrons_emitted > 500
        and temperature * neutrons_emitted < 500_000
    )


def reactor_efficiency(
    voltage: int | float, current: int | float, theoretical_max_power: int | float
) -> Bands:
    """Assess reactor efficiency zone.

    :param voltage: int or float - voltage value.
    :param current: int or float - current value.
    :param theoretical_max_power: int or float - power that corresponds to a 100% efficiency.
    :return: str - one of ('green', 'orange', 'red', or 'black').

    Efficiency can be grouped into 4 bands:

    1. green -> efficiency of 80% or more,
    2. orange -> efficiency of less than 80% but at least 60%,
    3. red -> efficiency below 60%, but still 30% or more,
    4. black ->  less than 30% efficient.

    The percentage value is calculated as
    (generated power/ theoretical max power)*100
    where generated power = voltage * current
    """

    generated_power = voltage * current
    efficiency = generated_power / theoretical_max_power * 100

    if efficiency >= 80:
        return Bands.GREEN
    if efficiency >= 60:
        return Bands.ORANGE
    if efficiency >= 30:
        return Bands.RED
    return Bands.BLACK


def fail_safe(
    temperature: int | float,
    neutrons_produced_per_second: int | float,
    threshold: int | float,
) -> Literal["LOW", "NORMAL", "DANGER"]:
    """Assess and return status code for the reactor.

    :param temperature: int or float - value of the temperature in kelvin.
    :param neutrons_produced_per_second: int or float - neutron flux.
    :param threshold: int or float - threshold for category.
    :return: str - one of ('LOW', 'NORMAL', 'DANGER').

    1. 'LOW' -> `temperature * neutrons per second` < 90% of `threshold`
    2. 'NORMAL' -> `temperature * neutrons per second` +/- 10% of `threshold`
    3. 'DANGER' -> `temperature * neutrons per second` is not in the above-stated ranges
    """

    criticality = temperature * neutrons_produced_per_second

    if _percentage(criticality, threshold) < 90:
        return "LOW"
    if _percentage(criticality, threshold) > 110:
        return "DANGER"
    return "NORMAL"


def _percentage(part: int | float, total: int | float) -> int | float:
    return part * 100 / total
