defmodule PigLatin do
  @alphabet ?a..?z |> Enum.map(&<<&1>>) |> Enum.join("")
  @vowels "aeiou"
  @consonants String.replace(@alphabet, ~r/[#{@vowels}]/i, "")
  @rule_1 ~r/^(?<word>([#{@vowels}]|xr|yt|ay)(.*))$/i
  @rule_2 ~r/^(?<consonants>[#{@consonants}]*)(?<rest>.*)/i
  @rule_3 ~r/^(?<consonants>[#{@consonants}]*qu)(?<rest>.*)/i
  @rule_4 ~r/^(?<consonants>[#{@consonants}]+)(?<rest>y.*)/i

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase), do: String.replace(phrase, ~r/\w+/, &translate_word/1)

  defp translate_word(word) do
    [@rule_1, @rule_4, @rule_3, @rule_2]
    |> Enum.find_value(&Regex.run(&1, word, capture: :all_names))
    |> Enum.reverse(["ay"])
    |> Enum.join()
  end
end
