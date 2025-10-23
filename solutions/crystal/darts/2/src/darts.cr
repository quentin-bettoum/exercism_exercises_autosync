module Darts
  def self.score(x : Number, y : Number) : Number
    case Math.hypot(x, y)
    when ..1  then 10
    when ..5  then 5
    when ..10 then 1
    else           0
    end
  end
end
