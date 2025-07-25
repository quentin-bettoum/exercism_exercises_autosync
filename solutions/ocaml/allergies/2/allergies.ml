open Base

type allergen =
  | Eggs
  | Peanuts
  | Shellfish
  | Strawberries
  | Tomatoes
  | Chocolate
  | Pollen
  | Cats

let allergen_scores =
  [
    (Cats, 128);
    (Pollen, 64);
    (Chocolate, 32);
    (Tomatoes, 16);
    (Strawberries, 8);
    (Shellfish, 4);
    (Peanuts, 2);
    (Eggs, 1);
  ]

let allergies score =
  let score = if score > 256 then score % 256 else score in
  let _, list =
    List.fold_left allergen_scores ~init:(score, [])
      ~f:(fun (score, list) (a, s) ->
        if score >= s then (score - s, a :: list) else (score, list))
  in
  list

let allergic_to score allergen =
  List.mem ~equal:phys_equal (allergies score) allergen

(* let allergens = [ Eggs; Peanuts; Shellfish; Strawberries; Tomatoes; Chocolate; Pollen; Cats ] *)

(* let score = function *)
  (* | Eggs -> 1 *)
  (* | Peanuts -> 2 *)
  (* | Shellfish -> 4 *)
  (* | Strawberries -> 8 *)
  (* | Tomatoes -> 16 *)
  (* | Chocolate -> 32 *)
  (* | Pollen -> 64 *)
  (* | Cats -> 128 *)

(* let allergic_to flag allergen = flag land score allergen = score allergen *)
(* let allergies flag = List.filter allergens ~f:(allergic_to flag) *)
