# frozen_string_literal: true

# Count eggs
module EliudsEggs
  def self.egg_count(binary_value)
    binary_value.to_s(2).count('1')
  end
end
