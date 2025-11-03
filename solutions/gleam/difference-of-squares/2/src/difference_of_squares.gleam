import gleam/int
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  // let sum = { 1 + n } * n / 2
  // sum * sum

  list.range(1, n)
  |> int.sum
  |> fn(x) { x * x }
}

pub fn sum_of_squares(n: Int) -> Int {
  // n * { 1 + n } * { 2 * n + 1 } / 6

  list.range(1, n)
  |> list.map(fn(x) { x * x })
  |> int.sum
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
