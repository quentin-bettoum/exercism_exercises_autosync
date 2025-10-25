module NucleotideCount
  extend self

  BASE = {'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0}

  def nucleotide_counts(nucleotides : String) : Hash(Char, Int32)
    raise ArgumentError.new "Unknown nucleotide" unless nucleotides.chars.all?(&.in_set?("ACGT"))
    nucleotides.chars.tally.merge(BASE) { |_, a, b| a + b }
  end
end
