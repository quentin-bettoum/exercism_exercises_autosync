defmodule Username do
  # Using Enum
  # def sanitize(username), do: Enum.flat_map(username, &sanitize_char/1)

  # Using tail call recursion
  def sanitize([]), do: []
  def sanitize([head | tail]), do: sanitize_char(head) ++ sanitize(tail)

  def sanitize_char(?ß), do: ~c[ss]
  def sanitize_char(?ä), do: ~c[ae]
  def sanitize_char(?ö), do: ~c[oe]
  def sanitize_char(?ü), do: ~c[ue]
  def sanitize_char(?_), do: ~c[_]
  def sanitize_char(char) when char in ?a..?z, do: [char]
  def sanitize_char(_), do: ~c[]
end
