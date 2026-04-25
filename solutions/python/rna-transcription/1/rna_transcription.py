def to_rna(dna_strand: str) -> str:
    return dna_strand.translate({
        ord("A"): "U",
        ord("C"): "G",
        ord("G"): "C",
        ord("T"): "A",
    })
