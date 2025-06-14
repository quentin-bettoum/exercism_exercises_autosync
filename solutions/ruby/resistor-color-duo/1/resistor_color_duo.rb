# frozen_string_literal: true

# Handle resistors resistance value based on their color
module ResistorColorDuo
  CODE_COLORS = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }.freeze

  def self.value(colors)
    "#{CODE_COLORS[colors[0]]}#{CODE_COLORS[colors[1]]}".to_i
  end
end
