defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    base_freq = letters_frequencies(base)

    Enum.filter(candidates, fn candidate ->
      candidate = String.downcase(candidate)
      candidate != base && letters_frequencies(candidate) == base_freq
    end)
  end

  defp letters_frequencies(word) do
    word
    |> String.graphemes()
    |> Enum.frequencies()
  end

  # defp letters_frequencies(word) do
  #   for letter <- String.graphemes(word), reduce: %{} do
  #     acc -> Map.update(acc, letter, 1, & &1 + 1)
  #   end
  # end
end
