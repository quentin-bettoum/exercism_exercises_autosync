module Hamming
  def self.distance(strand1 : String, strand2 : String) : Number
    raise ArgumentError.new "stranlds must be of the same size" if strand1.size != strand2.size

    strand1.chars.zip(strand2.chars).count { |x, y| x != y }
  end
end
