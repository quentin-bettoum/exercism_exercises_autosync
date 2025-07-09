defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) when is_tuple(numbers) do
    low = 0
    high = tuple_size(numbers) - 1

    binary_search(numbers, key, low, high)
  end

  defp binary_search(_numbers, _key, low, high) when low > high, do: :not_found
  defp binary_search(numbers, key, low, high) do
    mid = low + div(high - low, 2)
    mid_value = elem(numbers, mid)

    cond do
      mid_value === key -> {:ok, mid}
      mid_value < key -> binary_search(numbers, key, mid + 1, high)
      true -> binary_search(numbers, key, low, mid - 1)
    end
  end
end
