# frozen_string_literal: true

# Converts a number into its corresponding raindrop sounds
module Raindrops
  def self.convert(number)
    str = ''
    str += 'Pling' if (number % 3).zero?
    str += 'Plang' if (number % 5).zero?
    str += 'Plong' if (number % 7).zero?

    str.empty? ? number.to_s : str
  end
end
