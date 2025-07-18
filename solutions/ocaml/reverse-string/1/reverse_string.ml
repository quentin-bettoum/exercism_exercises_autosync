let reverse_string (s : string) : string =
  let len = String.length s in
  String.init len (fun i -> s.[len - 1 - i])
;;
