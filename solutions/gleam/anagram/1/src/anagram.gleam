import gleam/dict
import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let word = string.lowercase(word)
  let word_freq = letters_frequencies(word)

  use candidate <- list.filter(candidates)
  let candidate_lower = string.lowercase(candidate)
  candidate_lower != word && letters_frequencies(candidate_lower) == word_freq
}

fn letters_frequencies(word: String) -> dict.Dict(String, Int) {
  word
  |> string.to_graphemes()
  |> list.fold(dict.new(), fn(acc, letter) {
    let count = case dict.get(acc, letter) {
      Ok(n) -> n + 1
      Error(Nil) -> 1
    }

    dict.insert(acc, letter, count)
  })
}
