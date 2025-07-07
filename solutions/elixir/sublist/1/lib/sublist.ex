defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    a_length = Enum.count(a)
    b_length = Enum.count(b)

    cond do
      a_length === b_length and a === b -> :equal
      Enum.empty?(a) or b |> Enum.chunk_every(a_length, 1, :discard) |> Enum.member?(a) -> :sublist
      Enum.empty?(b) or a |> Enum.chunk_every(b_length, 1, :discard) |> Enum.member?(b) -> :superlist
      true -> :unequal
    end
  end
end
