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

  // Solution 2
  // 
  // sentence
  // |> string.lowercase
  // |> string.to_graphemes
  // |> list.filter(string.contains(does: alphabet, contain: _))
  // |> list.unique
  // |> list.length
  // == 26

  // Solution 3
  // 
  // let sentence = string.lowercase(sentence)

  // alphabet
  // |> string.to_graphemes
  // |> list.all(string.contains(does: sentence, contain: _))
}
