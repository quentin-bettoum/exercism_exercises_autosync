module ResistorColor
  enum Color : Int32
    Black
    Brown
    Red
    Orange
    Yellow
    Green
    Blue
    Violet
    Grey
    White
  end

  def self.color_code(color : String) : Int32 | Nil
    Color.parse(color).to_i
  end

  def self.colors : Array
    Color.values.map(&.to_s.downcase)
  end
end
