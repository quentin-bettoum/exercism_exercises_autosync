defmodule TopSecret do
  defdelegate to_ast(string), to: Code, as: :string_to_quoted!

  def decode_secret_message_part(ast, acc) do
    with {deftype, _, [{fun_name, _, arity}, _]}
         when deftype in [:def, :defp] and fun_name !== :when <- ast do
      name =
        fun_name
        |> to_string()
        |> String.slice(0, length(arity || []))

      {ast, [name | acc]}
    else
      {deftype, _, [{:when, _, [{fun_name, _, arity}, _]}, _]}
      when deftype in [:def, :defp] ->
        name =
          fun_name
          |> to_string()
          |> String.slice(0, length(arity || []))

        {ast, [name | acc]}

      _ ->
        {ast, acc}
    end
  end

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    acc
    |> Enum.reverse()
    |> Enum.join("")
  end
end
