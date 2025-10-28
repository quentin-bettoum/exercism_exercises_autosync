import gleam/list
import gleam/result
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  list.strict_zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
  |> result.try(fn(z) {
    Ok(list.count(z, fn(strands) { strands.0 != strands.1 }))
  })
}
