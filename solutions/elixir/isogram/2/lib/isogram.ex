defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.downcase()
    |> String.graphemes()
    |> Enum.filter(& &1 not in ["-", " "])
    |> then(& Enum.uniq(&1) === &1)
  end
end
