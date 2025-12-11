defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace("_", " ")
    |> then(&Regex.scan(~r/\b[\w']+\b/, &1))
    |> List.flatten
    |> Enum.frequencies()
  end
end
