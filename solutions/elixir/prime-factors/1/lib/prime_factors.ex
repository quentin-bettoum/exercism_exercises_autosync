defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer()) :: [pos_integer()]
  def factors_for(n) do
    Stream.unfold({n, 2}, fn
      {1, _} -> nil
      {curr, i} when i * i > curr -> {curr, {1, i}}
      {curr, i} when rem(curr, i) == 0 -> {i, {div(curr, i), i}}
      {curr, 2} -> {nil, {curr, 3}} # Skip even checks after 2
      {curr, i} -> {nil, {curr, i + 2}}
    end)
    |> Stream.reject(&is_nil/1)
    |> Enum.to_list()
  end

  # def factors_for(n), do: factorize(n, 2)

  # defp factorize(1, _), do: []
  # defp factorize(n, i) when i * i > n, do: [n]
  # defp factorize(n, i) when rem(n, i) == 0, do: [i | n |> div(i) |> factorize(i)]
  # defp factorize(2, i), do: factorize(n, 3) # Skip even checks after 2
  # defp factorize(n, i), do: factorize(n, i + 1)
end
