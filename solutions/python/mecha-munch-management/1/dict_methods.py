"""Functions to manage a users shopping cart items."""

from collections.abc import Iterable

type Item = str
Cart = dict[Item, int]
type StoreInventory = dict[Item, list]


def add_item(current_cart: Cart, items_to_add: Iterable[Item]) -> Cart:
    """Add items to shopping cart.

    :param current_cart: dict - the current shopping cart.
    :param items_to_add: iterable - items to add to the cart.
    :return: dict - the updated user cart dictionary.
    """

    for item in items_to_add:
        current_cart.setdefault(item, 0)
        current_cart[item] += 1

    return current_cart


def read_notes(notes: Iterable[Item]) -> Cart:
    """Create user cart from an iterable notes entry.

    :param notes: iterable of items to add to cart.
    :return: dict - a user shopping cart dictionary.
    """

    return add_item(Cart(), notes)


def update_recipes(ideas: Cart, recipe_updates: Cart) -> Cart:
    """Update the recipe ideas dictionary.

    :param ideas: dict - The "recipe ideas" dict.
    :param recipe_updates: iterable -  with updates for the ideas section.
    :return: dict - updated "recipe ideas" dict.
    """

    ideas.update(recipe_updates)
    return ideas


def sort_entries(cart: Cart) -> Cart:
    """Sort a users shopping cart in alphabetically order.

    :param cart: dict - a users shopping cart dictionary.
    :return: dict - users shopping cart sorted in alphabetical order.
    """

    return dict(sorted(cart.items()))


def send_to_store(cart: Cart, aisle_mapping: dict[Item, list[int | bool]]) -> Cart:
    """Combine users order to aisle and refrigeration information.

    :param cart: dict - users shopping cart dictionary.
    :param aisle_mapping: dict - aisle and refrigeration information dictionary.
    :return: dict - fulfillment dictionary ready to send to store.
    """

    fulfillment_dict = {}
    for item in cart:
        aisle_mapping[item].insert(0, cart[item])
        fulfillment_dict[item] = aisle_mapping[item]

    new_dict = Cart()
    new_dict |= sorted(fulfillment_dict.items(), reverse=True)
    return new_dict


def update_store_inventory(
    fulfillment_cart: StoreInventory, store_inventory: StoreInventory
) -> StoreInventory:
    """Update store inventory levels with user order.

    :param fulfillment cart: dict - fulfillment cart to send to store.
    :param store_inventory: dict - store available inventory
    :return: dict - store_inventory updated.
    """

    for key in fulfillment_cart:
        store_inventory[key][0] -= fulfillment_cart[key][0]
        if store_inventory[key][0] <= 0:
            store_inventory[key][0] = "Out of Stock"

    return store_inventory
