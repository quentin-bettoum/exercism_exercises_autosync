defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: flatten(list, [])
  defp flatten([], acc), do: acc
  defp flatten([hd | tl], acc) when is_list(hd), do: flatten(tl, flatten(hd, acc))
  defp flatten([nil | tl], acc), do: flatten(tl, acc)
  defp flatten([hd | tl], acc), do: flatten(tl, acc ++ [hd])
end
