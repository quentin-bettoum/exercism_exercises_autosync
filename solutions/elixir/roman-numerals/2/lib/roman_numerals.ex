defmodule RomanNumerals do
  @numeralValues %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    @numeralValues
    |> Map.keys()
    |> Enum.sort(:desc)
    |> Enum.reduce({number, ""}, fn x, {remaining, romanNumeral} ->
      repeat = Integer.floor_div(remaining, x)
      {remaining - x * repeat, romanNumeral <> String.duplicate(@numeralValues[x], repeat)}
    end)
    |> elem(1)
  end
end
