type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let transcribe_nucleotide = function
  | `A -> `U
  | `C -> `G
  | `G -> `C
  | `T -> `A

let to_rna = List.map transcribe_nucleotide
