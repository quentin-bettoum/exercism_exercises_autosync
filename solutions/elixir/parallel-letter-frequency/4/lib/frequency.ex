defmodule Frequency do
  @type frequency :: %{String.t() => pos_integer()}

  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: frequency
  def frequency(texts, workers) when is_list(texts) do
    texts
    |> Task.async_stream(&frequency/1, max_concurrency: workers)
    |> merge_frequencies()
  end

  @spec frequency(String.t()) :: frequency
  defp frequency(text) when is_binary(text) do
    text
    |> String.downcase()
    |> String.replace(~r/[[:punct:][:space:][:digit:]]/u, "")
    |> String.graphemes()
    # Same as Enum.frequencies/1
    |> Enum.reduce(%{}, fn g, acc ->
      Map.update(acc, g, 1, &(&1 + 1))
    end)
  end

  @spec merge_frequencies([{:ok, frequency}] | term()) :: frequency
  defp merge_frequencies(frequencies) do
    Enum.reduce(frequencies, %{}, fn {:ok, f}, acc ->
      Map.merge(acc, f, fn _key, v1, v2 -> v1 + v2 end)
    end)
  end
end
