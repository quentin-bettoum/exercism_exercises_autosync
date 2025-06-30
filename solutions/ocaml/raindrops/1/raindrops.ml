let raindrop_factors = [(3, "Pling");(5, "Plang");(7, "Plong");];;

let raindrop n =
  let result =
    raindrop_factors
    |> List.map (fun (k, v) -> if (n mod k = 0) then v else "")
    |> String.concat ""
  in
  if result = "" then string_of_int n else result 
