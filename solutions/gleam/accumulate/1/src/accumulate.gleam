pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [last] -> [fun(last)]
    [head, ..tail] -> [fun(head), ..accumulate(tail, fun)]
  }
}
