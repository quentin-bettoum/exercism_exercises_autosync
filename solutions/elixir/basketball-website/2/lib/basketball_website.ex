defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path
    |> String.split(".")
    |> read_from_path(data)
  end

  defp read_from_path([], data), do: data
  defp read_from_path([h | t], data), do: read_from_path(t, data[h])

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
