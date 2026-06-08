import gleam/int
import gleam/string

pub type Clock {
  Clock(hour: Int, minute: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  from_minutes(hour * 60 + minute)
}

fn from_minutes(minutes: Int) -> Clock {
  case minutes < 0 {
    False -> Clock(hour: { minutes / 60 } % 24, minute: minutes % 60)
    True -> from_minutes(minutes + 60 * 24)
  }
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  let Clock(hour:, minute:) = clock
  create(hour, minute + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  let Clock(hour:, minute:) = clock
  create(hour, minute - minutes)
}

pub fn display(clock: Clock) -> String {
  let Clock(hour:, minute:) = clock
  pad(hour) <> ":" <> pad(minute)
}

fn pad(number: Int) -> String {
  number |> int.to_string() |> string.pad_start(to: 2, with: "0")
}
