defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn candidate ->
      candidate = String.downcase(candidate)
      base = String.downcase(base)
      candidate !== base && count_letters(candidate) === count_letters(base)
    end)
  end

  defp count_letters(word) do
    word
    |> String.graphemes()
    |> Enum.reduce(%{}, fn letter, acc -> Map.update(acc, letter, 1, &(&1 + 1)) end)
  end
end
