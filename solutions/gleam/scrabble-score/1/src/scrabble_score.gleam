import gleam/list
import gleam/string

pub fn score(word: String) -> Int {
  word
  |> string.lowercase
  |> string.to_graphemes
  |> list.fold(0, fn(acc, c) { char_score(c) + acc })
}

fn char_score(char: String) -> Int {
  case char {
    "a" | "e" | "i" | "o" | "u" | "l" | "n" | "r" | "s" | "t" -> 1
    "d" | "g" -> 2
    "b" | "c" | "m" | "p" -> 3
    "f" | "h" | "v" | "w" | "y" -> 4
    "k" -> 5
    "j" | "x" -> 8
    "q" | "z" -> 10
    _ -> 0
  }
}
