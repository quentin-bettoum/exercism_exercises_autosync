# frozen_string_literal: true

# Handle DNA to RNA transcriptions
module Complement
  module_function

  DNA_TO_RNA = {
    'A' => 'U',
    'C' => 'G',
    'G' => 'C',
    'T' => 'A'
  }.freeze

  # @param rna [String]
  def of_dna(rna)
    rna.chars.map { |strand| DNA_TO_RNA[strand] }.join
  end
end
