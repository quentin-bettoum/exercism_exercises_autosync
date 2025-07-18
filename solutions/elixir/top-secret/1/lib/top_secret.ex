defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    with {deftype, _, [{fun_name, _, arity}, _]}
    when deftype in [:def, :defp] and fun_name !== :when <- ast do
      name = fun_name
      |> to_string()
      |> String.slice(0, length(arity || []))
      {ast, [name | acc]}
    else
      {deftype, _, [{:when, _, [{fun_name, _, arity}, _]}, _]}
      when deftype in [:def, :defp] ->
      name = fun_name
      |> to_string()
      |> String.slice(0, length(arity || []))
      {ast, [name | acc]}
      _ -> {ast, acc} end
  end

  def decode_secret_message(string) do

  end
end
