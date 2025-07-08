defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.to_charlist()
    |> Stream.filter(&alphanum?/1)
    |> Stream.map(&invert_letter/1)
    |> Stream.chunk_every(5)
    |> Enum.join(" ")
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.to_charlist()
    |> Stream.filter(&alphanum?/1)
    |> Enum.map(&invert_letter/1)
    |> List.to_string()
  end

  defp alphanum?(char), do: char in ?a..?z or char in ?0..?9

  defp invert_letter(char) when char in ?a..?z, do: ?a + (?z - char)
  defp invert_letter(char), do: char
end
