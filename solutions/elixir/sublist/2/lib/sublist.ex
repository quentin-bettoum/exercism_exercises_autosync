defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      Enum.empty?(a) or sublist?(a, b) -> :sublist
      Enum.empty?(b) or sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?(a, b) do
    b |> Enum.chunk_every(length(a), 1, :discard) |> Enum.member?(a)
  end
end
