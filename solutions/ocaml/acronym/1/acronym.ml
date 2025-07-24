open Base

let acronym (s : string) : string =
  String.split_on_chars ~on:[ ' '; '_'; '-' ] s
  |> List.filter_map ~f:(function
       | "" -> None
       | word -> Some (Char.to_string word.[0]))
  |> String.concat ~sep:""
  |> String.uppercase
