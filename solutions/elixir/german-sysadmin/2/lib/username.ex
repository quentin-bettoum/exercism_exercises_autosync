defmodule Username do
  @substitutes %{
    ?ä => 'ae',
    ?ö => 'oe',
    ?ü => 'ue',
    ?ß => 'ss'
  }
  @to_substitute Map.keys(@substitutes)
  @accepted_chars Enum.to_list(?a..?z) ++ '_'

  def sanitize([h | t]) do
    case h do
      h when h in @to_substitute -> @substitutes[h] ++ sanitize(t)
      h when h not in @accepted_chars -> sanitize(t)
      _ -> [h | sanitize(t)]
    end
  end

  def sanitize(_), do: ''
end
