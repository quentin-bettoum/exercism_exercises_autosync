defmodule Username do
  # Using Enum
  # def sanitize(username), do: Enum.flat_map(username, &sanitize_char/1)

  # Using tail call recursion
  def sanitize([]), do: []
  def sanitize([head | tail]), do: sanitize_char(head) ++ sanitize(tail)

  defp sanitize_char(?ß), do: ~c[ss]
  defp sanitize_char(?ä), do: ~c[ae]
  defp sanitize_char(?ö), do: ~c[oe]
  defp sanitize_char(?ü), do: ~c[ue]
  defp sanitize_char(?_), do: ~c[_]
  defp sanitize_char(char) when char in ?a..?z, do: [char]
  defp sanitize_char(_), do: ~c[]
end
