open Base

let response_for s =
  let s = String.strip s in
  if String.is_empty s then
    "Fine. Be that way!"
  else
    let is_question = String.is_suffix s ~suffix:"?" in
    let is_yelled =
      String.equal s (String.uppercase s)
      && String.exists s ~f:Char.is_uppercase
    in
    match (is_question, is_yelled) with
    | true, true -> "Calm down, I know what I'm doing!"
    | true, false -> "Sure."
    | false, true -> "Whoa, chill out!"
    | _ -> "Whatever."
