defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(""), do: {:ok, []}
  def of_rna(rna) do
    Regex.scan(~r/.{3}/, rna)
    |> List.flatten()
    |> Enum.reduce_while([], fn c, acc ->
      case of_codon(c) do
        {:error, err} -> {:halt, err}
        {:ok, "STOP"} -> {:halt, acc ++ ["STOP"]}
        {:ok, protein} ->
          if List.ends_with?(acc, ["STOP"]) do
            {:cont, acc}
          else
            {:cont, acc ++ [protein]}
          end
      end
    end)
    |> case do
      err when is_binary(err) or err === [] -> {:error, "invalid RNA"}
      proteins when is_list(proteins) ->
        if rem(String.length(rna), 3) === 0 or List.ends_with?(proteins, ["STOP"]) do
          {:ok, Enum.filter(proteins, & &1 !== "STOP")}
        else
          {:error, "invalid RNA"}
        end
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
  def of_codon(c) when c in ["UAA", "UAG", "UGA"], do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
