defmodule ResistorColorTrio do
  @code_colors [
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  ]

  @ohm_units [:ohms, :kiloohms, :megaohms, :gigaohms]

  @type ohm :: :ohms | :kiloohms | :megaohms | :gigaohms

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, ohm()}
  def label(colors) do
    [a, b, c] = Enum.take(colors, 3)
    with_metric_unit((@code_colors[a] * 10 + @code_colors[b]) * 10 ** @code_colors[c])
  end

  defp with_metric_unit(number, unit_level \\ 0)

  defp with_metric_unit(number, unit_level) when number >= 1000 do
    with_metric_unit(number / 1000, unit_level + 1)
  end

  defp with_metric_unit(number, unit_level) do
    {number, Enum.at(@ohm_units, unit_level)}
  end
end
