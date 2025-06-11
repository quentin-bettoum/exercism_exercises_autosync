defmodule Gigasecond do
  @gigasecond round(1.0e9)

  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from(erl_datetime) do
    erl_datetime
    |> NaiveDateTime.from_erl!()
    |> NaiveDateTime.add(@gigasecond)
    |> NaiveDateTime.to_erl()
  end
end
