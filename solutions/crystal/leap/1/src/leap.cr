module Year
  def self.leap?(year : Number) : Bool
    year % 4 == 0 && !(year%100 == 0) || year % 400 == 0
  end
end
