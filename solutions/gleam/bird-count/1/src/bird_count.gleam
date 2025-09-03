import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..] -> today
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [n, ..rest] -> [n + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  list.any(days, fn(n) { n == 0 })
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  list.count(days, fn(n) { n >= 5 })
}
