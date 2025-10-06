import gleam/option.{type Option, None, Some}

pub fn two_fer(name: Option(String)) -> String {
  let subject = case name {
    Some(x) -> x
    None -> "you"
  }
  "One for " <> subject <> ", one for me."
}
