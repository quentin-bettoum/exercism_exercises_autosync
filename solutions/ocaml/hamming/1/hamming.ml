type nucleotide = | A | C | G | T

let hamming_distance (strand1 : nucleotide list) (strand2 : nucleotide list) :
  (int, string) Result.t =
  match strand1, strand2 with
  | s1, s2 when s1 == s2 -> Ok 0
  | [], _ -> Error "left strand must not be empty"
  | _, [] -> Error "right strand must not be empty"
  | s1, s2 when List.length s1 != List.length s2 ->
    Error "left and right strands must be of equal length"
  | s1, s2 ->
    Ok
      (s1
       |> List.combine s2
       |> List.fold_left (fun acc (x, y) -> if x != y then acc + 1 else acc) 0)
;;
