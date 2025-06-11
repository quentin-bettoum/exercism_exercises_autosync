defmodule MatchingBrackets do
  @brackets %{
    "[" => "]",
    "{" => "}",
    "(" => ")"
  }
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    String.graphemes(str)
    |> do_check_brackets([], 0)
  end

  def do_check_brackets([head | rest], acc, count) do
    acc = [@brackets[head] | acc]
    do_check_brackets(rest, acc, count + 1)
    [next | _] = rest
  end
end
