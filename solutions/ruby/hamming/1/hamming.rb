# frozen_string_literal: true

# Calculate the Hamming distance between DNA strands
module Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError unless strand1.length == strand2.length

    strand1.chars.zip(strand2.chars).count { |x, y| x != y }
    # strand1.size.times.count { |i| strand1[i] != strand2[i] }
  end
end
