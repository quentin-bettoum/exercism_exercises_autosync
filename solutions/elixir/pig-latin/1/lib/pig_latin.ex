defmodule PigLatin do
  @alphabet ?a..?z |> Enum.map(&<<&1>>) |> Enum.join("")
  @vowels ~r/[aeiou]/i
  @consonants String.replace(@alphabet, @vowels, "")
  @rule_1 ~r/^(?:#{Regex.source(@vowels)}|xr|yt|ay)/i
  @rule_2 ~r/^(?<consonants>[#{@consonants}]*)(?<rest>.*)/i
  @rule_3 ~r/^(?<consonants>[#{@consonants}]*qu)(?<rest>.*)/i
  @rule_4 ~r/^(?<consonants>[#{@consonants}]+)(?<rest>y.*)/i

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      Regex.match?(@rule_1, word) ->
        word <> "ay"

      match = Regex.run(@rule_3, word, capture: :all_names) ->
        [consonants_qu, rest] = match
        rest <> consonants_qu <> "ay"

      match = Regex.run(@rule_4, word, capture: :all_names) ->
        [consonants_y, rest] = match
        rest <> consonants_y <> "ay"

      match = Regex.run(@rule_2, word, capture: :all_names) ->
        [consonants_qu, rest] = match
        rest <> consonants_qu <> "ay"
    end
  end
end
