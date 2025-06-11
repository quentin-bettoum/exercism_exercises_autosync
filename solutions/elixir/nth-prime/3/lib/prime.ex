defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "there is no zeroth prime"
  def nth(nth), do: find_prime(nth)

  def find_prime(nth, nbr \\ 3, found_count \\ 1)
  def find_prime(nth, nbr, found_count) when nth == found_count, do: nbr - 1
  def find_prime(nth, nbr, found_count) do
    found_count = if prime?(nbr), do: found_count + 1, else: found_count
    find_prime(nth, nbr + 1, found_count)
  end


  def prime?(nbr) do
    Enum.reduce_while(2..nbr, nil, fn divisor, _ ->
      cond do
        divisor == nbr -> {:halt, true}
        rem(nbr, divisor) != 0 -> {:cont, nil}
        true -> {:halt, false}
      end
    end)
  end
end
