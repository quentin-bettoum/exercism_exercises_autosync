module ArmstrongNumbers
  def self.armstrong_number?(input : Number) : Bool
    digits = input.digits
    power = digits.size

    input == digits.sum(&.**(power))
  end
end
