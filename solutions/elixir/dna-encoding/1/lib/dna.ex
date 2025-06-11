defmodule DNA do
  @encoded_nucleotides %{
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000,
    ?\s => 0b0000
  }
  @decoded_nucleotides Map.new(@encoded_nucleotides, fn {key, val} -> {val, key} end)

  def encode_nucleotide(code_point) do
    @encoded_nucleotides[code_point]
  end

  def decode_nucleotide(encoded_code) do
    @decoded_nucleotides[encoded_code]
  end

  def encode(dna) do
    do_encode(dna)
  end

  defp do_encode([h | t]), do: [encode_nucleotide(h) | do_encode(t)]
  defp do_encode(last), do: encode_nucleotide(last)

  def decode(dna) do
    do_decode(dna)
  end

  defp do_decode(<<h, t::binary>>), do: <<decode_nucleotide(h), do_decode(t)>>
  defp do_decode(last), do: decode_nucleotide(last)
end
