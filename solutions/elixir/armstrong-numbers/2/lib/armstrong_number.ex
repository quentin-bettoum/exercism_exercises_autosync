defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)

    power = length(digits)

    result =
      Enum.reduce(digits, 0, fn x, acc ->
        acc + Integer.pow(x, power)
      end)

    result === number
  end
end
