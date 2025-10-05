class EliudsEggs
  def self.egg_count(number : Int32) : Int32
    number.to_s(base: 2).count("1")
  end
end
