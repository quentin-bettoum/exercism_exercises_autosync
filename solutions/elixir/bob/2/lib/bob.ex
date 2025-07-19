defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input), do: input |> String.trim() |> reply()

  @spec reply(String.t()) :: String.t()
  def reply(""), do: "Fine. Be that way!"
  def reply(input) do
    is_question = String.ends_with?(input, "?")
    is_yelled = input === String.upcase(input) and Regex.match?(~r/\p{Lu}/u, input)

    cond do
      is_question and is_yelled ->
        "Calm down, I know what I'm doing!"

      is_question ->
        "Sure."

      is_yelled ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end
end
