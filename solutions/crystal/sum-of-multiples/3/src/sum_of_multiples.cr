module SumOfMultiples
  extend self

  def sum(factors : Iterable(Number), limit : Number) : Number
    valid_factors = factors.reject(&.zero?)

    (1...limit).select { |i|
      valid_factors.any? { |f| i.divisible_by?(f) }
    }.sum
  end
end
