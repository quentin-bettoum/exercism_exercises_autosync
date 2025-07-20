let is_pangram s =
  let s = String.lowercase_ascii s in
  String.for_all (String.contains s) "abcdefghijklmnopqrstuvwxyz"

(* open Base *)

(* let is_pangram s = *)
  (* let s = String.lowercase s in *)
  (* String.for_all "abcdefghijklmnopqrstuvwxyz" ~f:(String.contains s) *)

