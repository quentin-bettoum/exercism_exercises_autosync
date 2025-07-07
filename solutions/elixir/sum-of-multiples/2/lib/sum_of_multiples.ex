defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)//1
    |> Enum.filter(fn n -> Enum.any?(factors, &multiple?(n, &1)) end)
    |> Enum.sum()
  end

  defp multiple?(a, b), do: b != 0 and rem(a, b) === 0
end
