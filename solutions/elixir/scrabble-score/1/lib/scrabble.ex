defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.reduce(0, fn c, acc -> acc + char_score(c) end)
  end

  defp char_score(char) do
    case char do
      c when c in ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"] -> 1
      c when c in ["d", "g"] -> 2
      c when c in ["b", "c", "m", "p"] -> 3
      c when c in ["f", "h", "v", "w", "y"] -> 4
      "k" -> 5
      c when c in ["j", "x"] -> 8
      c when c in ["q", "z"] -> 10
      _ -> 0
    end
  end
end
