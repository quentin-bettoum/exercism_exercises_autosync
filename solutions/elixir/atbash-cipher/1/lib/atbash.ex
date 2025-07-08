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
    |> String.replace(~r/[[:punct:]\s]/, "")
    |> String.to_charlist()
    |> Stream.map(&invert_letter/1)
    |> Stream.chunk_every(5)
    |> Enum.intersperse(?\s)
    |> List.flatten()
    |> List.to_string()
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> String.replace(" ", "")
    |> String.to_charlist()
    |> Enum.map(&invert_letter/1)
    |> List.to_string()
  end

  def invert_letter(char) when char in ?a..?z, do: ?a + (?z - char)
  def invert_letter(char), do: char
end
