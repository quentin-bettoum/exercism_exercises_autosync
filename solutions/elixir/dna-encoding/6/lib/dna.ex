defmodule DNA do
  @encoded_nucleotides %{
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
    ?\s => 0b0000
  }
  @decoded_nucleotides Map.new(@encoded_nucleotides, fn {key, val} -> {val, key} end)

  def encode_nucleotide(code_point), do: @encoded_nucleotides[code_point]

  def decode_nucleotide(encoded_code), do: @decoded_nucleotides[encoded_code]

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], acc), do: acc
  defp do_encode([first | rest], acc) do
    do_encode(rest, <<acc::bitstring, encode_nucleotide(first)::4>>)
  end

  def decode(dna), do: do_decode(dna, ~c[])

  defp do_decode(<<>>, acc), do: Enum.reverse(acc)
  defp do_decode(<<head::4, tail::bitstring>>, acc) do
    do_decode(tail, [decode_nucleotide(head) | acc])
  end
end
