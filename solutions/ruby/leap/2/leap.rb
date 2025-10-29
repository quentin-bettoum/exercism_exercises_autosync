# frozen_string_literal: true

# Handle resistors resistance value based on their color
module Year
  module_function

  # @param year [Integer]
  def leap?(year)
    divisible_by4 = (year % 4).zero?
    divisible_by100 = (year % 100).zero?
    divisible_by400 = (year % 400).zero?

    divisible_by400 || divisible_by4 && !divisible_by100
  end
end
