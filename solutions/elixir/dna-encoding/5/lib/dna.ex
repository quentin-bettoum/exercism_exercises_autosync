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

  def encode([]), do: <<>>
  def encode([head | tail]) do
    <<encode_nucleotide(head)::4, encode(tail)::bitstring>>
  end

  def decode(<<>>), do: []
  def decode(<<head::4, tail::bitstring>>) do
    [decode_nucleotide(head) | decode(tail)]
  end
end
