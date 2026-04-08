"""Functions which helps the locomotive engineer to keep track of the train."""

type Routing = dict[str, str | list[str]]
type WagonsRows = list[list[tuple[int, str]]]


def get_list_of_wagons(*wagons: int) -> list[int]:
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """
    return list(wagons)


def fix_list_of_wagons(
    each_wagons_id: list[int], missing_wagons: list[int]
) -> list[int]:
    """Fix the list of wagons.

    :param each_wagons_id: list - the list of wagons.
    :param missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """

    first, second, third, *rest = each_wagons_id

    return [third, *missing_wagons, *rest, first, second]


def add_missing_stops(route: Routing, **stops: str) -> Routing:
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """
    return {**route, **{"stops": list(stops.values())}}


def extend_route_information(
    route: Routing, more_route_information: Routing
) -> Routing:
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """
    # return {**route, **more_route_information}
    return route | more_route_information


def fix_wagon_depot(wagons_rows: WagonsRows) -> WagonsRows:
    """Fix the list of rows of wagons.

    :param wagons_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """
    # [w1, w2, w3], [w4, w5, w6], [w7, w8, w9] = wagons_rows
    # return [[w1, w4, w7], [w2, w5, w8], [w3, w6, w9]]
    return [list(row) for row in zip(*wagons_rows, strict=True)]
