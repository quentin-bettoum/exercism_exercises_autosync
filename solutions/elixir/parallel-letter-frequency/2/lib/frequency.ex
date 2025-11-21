defmodule Frequency do
  @type frequency :: %{String.t() => pos_integer()}

  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: frequency
  def frequency(texts, workers) do
    case filtered_graphemes(texts) do
      [] -> %{}

      graphemes ->
        graphemes
        |> chunk(workers)
        |> Task.async_stream(&letter_frequencies/1)
        |> merge_frequencies()
    end
  end

  @spec filtered_graphemes([String.t()]) :: [String.t()]
  defp filtered_graphemes(texts) do
    texts
    |> Enum.join()
    |> String.downcase()
    |> String.replace(~r/[[:punct:][:space:][:digit:]]/, "")
    |> String.codepoints()
  end

  @spec chunk([String.t()], non_neg_integer()) :: [[String.t()]]
  defp chunk(graphemes, workers) do
    graphemes_per_chunk = ceil(Enum.count(graphemes) / workers)
    Enum.chunk_every(graphemes, graphemes_per_chunk)
  end

  # Reimplement `Enum.frequencies/1`
  @spec letter_frequencies([String.t()]) :: frequency
  defp letter_frequencies(graphemes) do
    Enum.reduce(graphemes, %{}, fn g, acc ->
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
