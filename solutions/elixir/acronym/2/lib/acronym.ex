defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/[^\w\s-]|_+/, "")
    |> String.split(~r/[-\s]+/)
    |> Enum.map(& String.at(&1, 0))
    |> List.to_string()
    |> String.upcase()
  end
end
