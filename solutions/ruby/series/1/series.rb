# frozen_string_literal: true

# Handle series
class Series
  def initialize(digits)
    raise ArgumentError if digits.empty?

    @digits = digits
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > @digits.length

    @digits.chars.each_cons(slice_length).map(&:join)
  end
end
