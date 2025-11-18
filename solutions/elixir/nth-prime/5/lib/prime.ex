defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "there is no zeroth prime"
  def nth(nth) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Stream.take(nth)
    |> Enum.at(-1)
  end

  defp prime?(1), do: false
  defp prime?(2), do: true
  defp prime?(3), do: true
  defp prime?(nbr) do
    limit = nbr |> :math.sqrt |> trunc
    not Enum.any?(2..limit, fn divisor -> rem(nbr, divisor) === 0 end)
  end
end
