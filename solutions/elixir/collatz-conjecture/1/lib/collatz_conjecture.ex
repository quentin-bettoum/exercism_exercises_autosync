defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    do_calc(input, 0)
  end

  def do_calc(1, count), do: count
  def do_calc(input, count) when rem(input, 2), do: do_calc(input/2, count+1)
  def do_calc(input, count), do: do_calc(input*3+1, count+1)
end
