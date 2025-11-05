module Grains
  extend self

  def square(number : Number) : UInt64
    raise ArgumentError.new "number must be between 1 and 64" unless number > 0 && number <= 64

    2_u64 ** (number - 1)
  end

  def total : UInt64
    UInt64::MAX
  end
end
