enum ResistorColor
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

  def self.color_code(color : String) : Int32 | Nil
    parse(color).value
  end

  def self.colors : Array
    names.map(&.downcase)
  end
end

