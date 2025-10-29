defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    divisible_by4 = rem(year, 4) === 0
    divisible_by100 = rem(year, 100) === 0
    divisible_by400 = rem(year, 400) === 0

    divisible_by400 or divisible_by4 and !divisible_by100
  end
end
