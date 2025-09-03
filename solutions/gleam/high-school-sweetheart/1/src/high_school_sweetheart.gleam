import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  name |> string.trim() |> string.first() |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter()
  |> string.uppercase()
  |> string.append(suffix: ".")
}

pub fn initials(full_name: String) {
  let assert Ok(#(first_name, last_name)) = string.split_once(full_name, " ")
    as "error"
  initial(first_name) <> " " <> initial(last_name)
}

pub fn pair(full_name1: String, full_name2: String) {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
