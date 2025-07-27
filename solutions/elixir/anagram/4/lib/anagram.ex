defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    Enum.filter(candidates, fn candidate ->
      candidate = String.downcase(candidate)
      candidate !== base && count_letters(candidate) === count_letters(base)
    end)
  end

  defp count_letters(word) do
    word
    |> String.graphemes()
    |> Enum.frequencies()
  end
end
