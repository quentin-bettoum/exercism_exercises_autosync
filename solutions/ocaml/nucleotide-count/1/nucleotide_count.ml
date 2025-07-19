open Base

let invalid_nucleotide c = not (String.contains "ACGT" c)
let empty = Map.empty (module Char)

let count_nucleotide (s : string) (c : char) : (int, char) Result.t =
  if invalid_nucleotide c
  then Error c
  else match String.find s ~f:invalid_nucleotide with
    | None -> Ok (String.count s ~f:(Char.equal c))
    | Some n -> Error n
;;

let count_nucleotides s =
  String.fold_result s ~init:empty ~f:(fun map c ->
    if invalid_nucleotide c
    then Error c
    else
      Ok
        (Map.update map c ~f:(function
           | None -> 1
           | Some x -> x + 1)))
;;
