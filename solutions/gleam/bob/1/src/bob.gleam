import gleam/list
import gleam/string

pub fn hey(remark: String) -> String {
  case string.trim(remark) {
    "" -> "Fine. Be that way!"
    message -> reply(message)
  }
}

fn reply(message: String) -> String {
  let is_question = string.ends_with(message, "?")
  let uppercased_message = string.uppercase(message)
  let is_yelled =
    message == uppercased_message
    && uppercased_message
    |> string.to_graphemes()
    |> list.any(string.contains(does: "ABCDEFGHIJKLMNOPQRSTUVWXYZ", contain: _))

  case is_question, is_yelled {
    True, True -> "Calm down, I know what I'm doing!"
    True, False -> "Sure."
    False, True -> "Whoa, chill out!"
    False, False -> "Whatever."
  }
}
