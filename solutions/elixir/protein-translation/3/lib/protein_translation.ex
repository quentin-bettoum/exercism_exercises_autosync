defmodule ProteinTranslation do
  @stop_codons ["UAA", "UAG", "UGA"]

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(""), do: {:ok, []}
  def of_rna(<<head::binary-size(3)>> <> _) when head in @stop_codons, do: {:ok, []}
  def of_rna(rna) do
    rna
    |> String.split(~r/.{3}/, include_captures: true, trim: true)
    |> Enum.reduce_while([], fn c, acc ->
      case of_codon(c) do
        {:error, error} -> {:halt, error}
        {:ok, "STOP"} -> {:halt, acc}
        # {:ok, protein} -> {:cont, acc ++ [protein]}
        {:ok, protein} -> {:cont, [protein | acc]}
      end
    end)
    |> case do
      proteins when is_list(proteins) -> {:ok, Enum.reverse(proteins)}
      _ -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon("AUG"), do: {:ok, "Methionine"}
  def of_codon("UGG"), do: {:ok, "Tryptophan"}
  def of_codon(c) when c in ["UUA", "UUG"], do: {:ok, "Leucine"}
  def of_codon(c) when c in ["UGU", "UGC"], do: {:ok, "Cysteine"}
  def of_codon(c) when c in ["UAU", "UAC"], do: {:ok, "Tyrosine"}
  def of_codon(c) when c in ["UUU", "UUC"], do: {:ok, "Phenylalanine"}
  def of_codon(c) when c in ["UCU", "UCC", "UCA", "UCG"], do: {:ok, "Serine"}
  def of_codon(c) when c in @stop_codons, do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
