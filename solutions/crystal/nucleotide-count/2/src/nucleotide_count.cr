module NucleotideCount
  extend self

  def nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    # raise ArgumentError.new "Unknown nucleotide" unless nucleotides.chars.all? &.in_set?("ACGT")
    raise ArgumentError.new "Unknown nucleotide" unless nucleotides.matches? /^[ACGT]*$/

    nucleotides.chars.tally({'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0})
  end
end
