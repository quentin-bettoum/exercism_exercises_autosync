# frozen_string_literal: true

# Get the resistor value from its color
module ResistorColor
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  def self.color_code(color)
    COLORS.find_index(color)
  end
end
