type nucleotide = | A | C | G | T

let hamming_distance (strand1 : nucleotide list) (strand2 : nucleotide list) :
  (int, string) Result.t =
  match List.length strand1, List.length strand2 with
  | s1, s2 when s1 = s2 ->
    Ok
      (List.fold_left2
         (fun distance strand1 strand2 ->
            if strand1 <> strand2 then distance + 1 else distance)
         0
         strand1
         strand2)
  | _ ->
    Error "strands must be of equal length"
;;
