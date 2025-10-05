class Raindrops
  def self.convert(num : Int32) : String
    str = ""
    str += "Pling" if (num % 3).zero?
    str += "Plang" if (num % 5).zero?
    str += "Plong" if (num % 7).zero?

    str.empty? ? num.to_s : str
  end
end
