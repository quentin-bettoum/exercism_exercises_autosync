import gleam/list
import gleam/set
import gleam/string

const alphabet: String = "abcdefghijklmnopqrstuvwxyz"

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(string.contains(does: alphabet, contain: _))
  |> set.from_list
  |> set.size
  == 26

  // sentence
  // |> string.lowercase
  // |> string.to_graphemes
  // |> list.filter(string.contains(does: alphabet, contain: _))
  // |> list.unique
  // |> list.length
  // == 26
}
