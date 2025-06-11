defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    |> read_from_path(data)
  end

  defp read_from_path([], data), do: data
  defp read_from_path([h | t], data), do: read_from_path(t, data[h])

  def get_in_path(data, path), do: data |> get_in(String.split(path, "."))
end
