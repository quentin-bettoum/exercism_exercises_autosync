class RnaComplement
  def self.of_dna(strand : String) : String
    strand.tr("ACGT", "UGCA")
  end
end
