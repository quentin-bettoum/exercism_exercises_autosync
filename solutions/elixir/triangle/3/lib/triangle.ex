defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0,
    do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when a + b < c or b + c < a or a + c < b,
    do: {:error, "side lengths violate triangle inequality"}

  def kind(x, x, x), do: {:ok, :equilateral}
  def kind(x, x, _), do: {:ok, :isosceles}
  def kind(x, _, x), do: {:ok, :isosceles}
  def kind(_, x, x), do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}
end
