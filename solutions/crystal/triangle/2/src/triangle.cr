alias Side = Float64 | Int32
alias Sides = Tuple(Side, Side, Side)

class Triangle
  def initialize(sides : Sides)
    @a, @b, @c = sides

    raise ArgumentError.new "all side lengths must be positive" unless sides.all? &.positive?
    raise ArgumentError.new "side lengths violate triangle inequality" unless sides.max * 2 < sides.sum
  end

  def equilateral?
    @a == @b == @c
  end

  def isosceles?
    @a == @b || @b == @c || @c == @a
  end

  def scalene?
    !isosceles?
  end
end
