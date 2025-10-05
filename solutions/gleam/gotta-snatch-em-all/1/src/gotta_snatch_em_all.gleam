import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let is_possible =
    set.contains(collection, my_card) && !set.contains(collection, their_card)

  let new_set = collection |> set.delete(my_card) |> set.insert(their_card)

  #(is_possible, new_set)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(fn(acc, x) { set.intersection(acc, x) })
  |> result.unwrap(set.from_list([]))
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(fn(acc, x) { set.union(acc, x) })
  |> result.unwrap(set.from_list([]))
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(card) { string.starts_with(card, "Shiny ") })
}
