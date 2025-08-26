type nucleotide = | A | C | G | T

let hamming_distance (strand1 : nucleotide list) (strand2 : nucleotide list) :
  (int, string) Result.t =
  match strand1, strand2 with
  | s1, s2 when s1 = s2 -> Ok 0
  | s1, s2 when List.length s1 <> List.length s2 ->
    Error "strands must be of equal length"
  | [], _ | _, [] -> Error "strands must be of equal length"
  | s1, s2 ->
    Ok (List.fold_left2 (fun distance s1 s2 -> if s1 <> s2 then distance + 1 else distance) 0 s1 s2)
;;
