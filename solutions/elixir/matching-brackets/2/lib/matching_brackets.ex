defmodule MatchingBrackets do
  @brackets %{
    "[" => "]",
    "{" => "}",
    "(" => ")"
  }

  @opening_brackets Map.keys(@brackets)
  @closing_brackets Map.values(@brackets)

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.graphemes()
    |> Enum.reduce_while([], fn g, stack ->
      cond do
        g in @closing_brackets ->
          opening_bracket = get_opening_bracket(g)
          if List.first(stack) === opening_bracket do
            {:cont, List.delete(stack, opening_bracket)}
          else
            {:halt, false}
          end
        g in @opening_brackets ->
          {:cont, [g | stack]}
        true ->
          {:cont, stack}
      end
    end)
    |> then(& &1 === [])
  end

  def get_opening_bracket(closing_bracket) do
    @brackets |> Map.new(fn {k, v} -> {v, k} end) |> Map.get(closing_bracket)
  end
end
