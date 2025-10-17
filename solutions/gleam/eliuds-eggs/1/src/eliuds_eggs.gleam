import gleam/int
import gleam/list
import gleam/string

pub fn egg_count(number: Int) -> Int {
  number
  |> int.to_base2
  |> string.split("")
  |> list.count(fn(l) { l == "1" })
}
