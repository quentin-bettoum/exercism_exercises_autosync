defmodule RnaTranscription do
  @dna_to_rna %{
    ?A => ?U,
    ?C => ?G,
    ?G => ?C,
    ?T => ?A,
  }

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna), do: Enum.map(dna, & @dna_to_rna[&1])
end
