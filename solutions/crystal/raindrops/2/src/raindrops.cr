class Raindrops
  def self.convert(num : Int32) : String
    str = ""
    str += "Pling" if num.divisible_by?(3)
    str += "Plang" if num.divisible_by?(5)
    str += "Plong" if num.divisible_by?(7)

    str.empty? ? num.to_s : str
  end
end
