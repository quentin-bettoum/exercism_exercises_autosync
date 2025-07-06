defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    ~r/(\w|\s)\1*/u
    |> Regex.scan(string)
    |> Enum.reduce("", fn [total, letter], acc ->
      case String.length(total) do
        1 -> acc <> letter
        x -> acc <> to_string(x) <> letter
      end
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    ~r/(\d+)(\w|\s)/u
    |> Regex.scan(string)
    |> Enum.reduce(string, fn [from, count, letter], acc ->
      to = String.duplicate(letter, String.to_integer(count))
      String.replace(acc, from, to)
    end)
  end
end
