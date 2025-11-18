pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    x if x <= 0 -> Error(Nil)
    _ -> Ok(find_nth_prime(2, number))
  }
}

fn find_nth_prime(num: Int, remaining: Int) -> Int {
  case is_prime(num) {
    True -> {
      case remaining {
        1 -> num
        _ -> find_nth_prime(num + 1, remaining - 1)
      }
    }
    False -> find_nth_prime(num + 1, remaining)
  }
}

fn is_prime(nbr: Int) -> Bool {
  case nbr {
    2 -> True
    n if n % 2 == 0 -> False
    _ -> check_is_prime(nbr, 3)
  }
}

fn check_is_prime(n: Int, x: Int) -> Bool {
  case x * x > n, n % x != 0 {
    True, _ -> True
    _, True -> check_is_prime(n, x + 2)
    False, False -> False
  }
}
