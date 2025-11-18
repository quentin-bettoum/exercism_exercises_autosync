import gleam/list

pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    x if x <= 0 -> Error(Nil)
    1 -> Ok(2)
    2 -> Ok(3)
    3 -> Ok(5)
    _ -> nth_prime(7, [2, 3, 5], number)
  }
}

fn nth_prime(candidate: Int, primes: List(Int), nth: Int) -> Result(Int, Nil) {
  case nth == list.length(primes) {
    True -> list.first(primes)
    False -> {
      case list.all(primes, fn(x) { candidate % x != 0 }) {
        True -> [candidate, ..primes]
        False -> primes
      }
      |> nth_prime(candidate + 2, _, nth)
    }
  }
}
