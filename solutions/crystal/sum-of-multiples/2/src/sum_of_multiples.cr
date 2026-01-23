module SumOfMultiples
  extend self

  def sum(factors : Array(Number), limit : Number) : Number
    valid_factors = factors.reject(&.zero?)

    (1...limit).each.select { |i|
      valid_factors.any? { |f| i.divisible_by?(f) }
    }.sum
  end
end
