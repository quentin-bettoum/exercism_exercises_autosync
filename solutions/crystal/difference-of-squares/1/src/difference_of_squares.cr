module Squares
  extend self

  def square_of_sum(n : Number) : Number
    (1..n).sum ** 2
  end

  def sum_of_squares(n : Number) : Number
    (1..n).sum { |x| x * x }
  end

  def difference_of_squares(n : Number) : Number
    square_of_sum(n) - sum_of_squares(n)
  end
end
