import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok("") -> Error(Nil)
    Ok(c) -> Ok(c |> string.trim |> string.split("\n"))
    _ -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path) |> result.replace_error(Nil)
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  email
  |> string.append("\n")
  |> simplifile.append(to: path, contents: _)
  |> result.replace_error(Nil)
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let assert Ok(Nil) = create_log_file(log_path)

  read_emails(emails_path)
  |> result.unwrap([])
  |> list.each(fn(e) {
    case send_email(e) {
      Ok(Nil) -> log_sent_email(log_path, e)
      e -> e
    }
  })

  Ok(Nil)
}
