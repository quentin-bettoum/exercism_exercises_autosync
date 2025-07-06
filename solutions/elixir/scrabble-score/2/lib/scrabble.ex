defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> to_charlist()
    |> Enum.sum_by(&char_score/1)
  end

  defp char_score(c) when c in ~c(aeioulnrst), do: 1
  defp char_score(c) when c in ~c(dg), do: 2
  defp char_score(c) when c in ~c(bcmp), do: 3
  defp char_score(c) when c in ~c(fhvwy), do: 4
  defp char_score(c) when c in ~c(k), do: 5
  defp char_score(c) when c in ~c(jx), do: 8
  defp char_score(c) when c in ~c(qz), do: 10
  defp char_score(_), do: 0
end
