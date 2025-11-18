module NthPrime
  extend self

  def prime(number : Int32) : Int32
    raise ArgumentError.new "number must be greater than 0" unless number > 0

    (2..).each.select(&->prime?(Int32)).first(number).to_a.last
  end

  private def prime?(number : Int32) : Bool
    return true if number == 2
    return false if number % 2 == 0

    limit = Math.sqrt(number)
    !(3..limit).step(2).any? { |x| number % x == 0 }
  end
end
