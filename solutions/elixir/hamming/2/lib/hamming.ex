defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  def hamming_distance(strand1, strand2) do
    diff =
      Enum.zip_reduce(strand1, strand2, 0, fn
        x, y, acc when x != y -> acc + 1
        _, _, acc -> acc
      end)

      # Enum.zip_reduce(strand1, strand2, 0, fn x, y, acc ->
      #   if x != y, do: acc + 1, else: acc
      # end)

    {:ok, diff}
  end
end
