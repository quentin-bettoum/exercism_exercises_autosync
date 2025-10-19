enum ResistorColorDuo
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

  def self.value(values : Array(String)) : Number
    (parse(values[0]).value.to_s + parse(values[1]).value.to_s).to_i
  end
end

