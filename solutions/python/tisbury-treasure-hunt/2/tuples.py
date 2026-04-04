"""Functions to help Azara and Rui locate pirate treasure."""

from typing import cast

Treasure = str
AzaraCoordinate = str
AzaraRecord = tuple[Treasure, AzaraCoordinate]

Location = str
Quadrant = str
RuiCoordinate = tuple[str, str]
RuiRecord = tuple[Location, RuiCoordinate, Quadrant]

CombinedRecord = tuple[Treasure, AzaraCoordinate, Location, RuiCoordinate, Quadrant]


def get_coordinate(record: AzaraRecord) -> AzaraCoordinate:
    """Return coordinate value from a tuple containing the treasure name, and treasure coordinate.

    :param record: tuple - with a (treasure, coordinate) pair.
    :return: str - the extracted map coordinate.
    """

    return record[1]


def convert_coordinate(coordinate: AzaraCoordinate) -> RuiCoordinate:
    """Split the given coordinate into tuple containing its individual components.

    :param coordinate: str - a string map coordinate
    :return: tuple - the string coordinate split into its individual components.
    """

    return (coordinate[0], coordinate[1])


def compare_records(azara_record: AzaraRecord, rui_record: RuiRecord) -> bool:
    """Compare two record types and determine if their coordinates match.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, tuple(coordinate_1, coordinate_2), quadrant) trio.
    :return: bool - do the coordinates match?
    """

    azara_coord = convert_coordinate(get_coordinate(azara_record))
    _, rui_coord, _ = rui_record
    return azara_coord == rui_coord


def create_record(
    azara_record: AzaraRecord, rui_record: RuiRecord
) -> CombinedRecord | str:
    """Combine the two record types (if possible) and create a combined record group.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, coordinate, quadrant) trio.
    :return: tuple or str - the combined record (if compatible), or the string "not a match" (if incompatible).
    """

    if compare_records(azara_record, rui_record):
        return cast(CombinedRecord, azara_record + rui_record)
    return "not a match"


def clean_up(combined_record_group: tuple[CombinedRecord, ...]) -> str:
    """Clean up a combined record group into a multi-line string of single records.

    :param combined_record_group: tuple - everything from both participants.
    :return: str - everything "cleaned", excess coordinates and information are removed.

    The return statement should be a multi-lined string with items separated by newlines.

    (see HINTS.md for an example).
    """

    return "".join([
        f"{(treasure, location, rui_coord, quadrant)}\n"
        for treasure, _, location, rui_coord, quadrant in combined_record_group
    ])
