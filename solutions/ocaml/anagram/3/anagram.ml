open Base

let count_letters word =
  word
  |> String.to_list
  |> List.fold
       ~init:(Map.empty (module Char))
       ~f:(fun map letter ->
         Map.update map letter ~f:(function
           | None -> 1
           | Some n -> n + 1))

let anagrams base candidates =
  let base = String.lowercase base in
  List.filter candidates ~f:(fun c ->
      let c = String.lowercase c in
      (not (String.equal c base))
      && Map.equal Int.equal (count_letters c) (count_letters base))
