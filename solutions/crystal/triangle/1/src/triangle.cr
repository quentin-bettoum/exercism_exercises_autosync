alias TriangleSide = Float64 | Int32

class Triangle
  @a : TriangleSide
  @b : TriangleSide
  @c : TriangleSide

  def initialize(triangle : Tuple(TriangleSide, TriangleSide, TriangleSide))
    @a = triangle[0]
    @b = triangle[1]
    @c = triangle[2]

    if @a <= 0 || @b <= 0 || @c <= 0
      raise ArgumentError.new "all side lengths must be positive"
    elsif @a + @b < @c || @b + @c < @a || @c + @a < @b
      raise ArgumentError.new "side lengths violate triangle inequality"
    end
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
