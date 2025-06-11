defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.reduce(input, %{}, fn {points, letters}, acc ->
      Enum.reduce(letters, acc, fn l, acc ->
        Map.put(acc, String.downcase(l), points)
      end)
    end)
  end
end
