# frozen_string_literal: true

# Handle DNA to RNA transcriptions
module Complement
  module_function

  # @param dna [String]
  def of_dna(dna)
    dna.tr('ACGT', 'UGCA')
  end
end
