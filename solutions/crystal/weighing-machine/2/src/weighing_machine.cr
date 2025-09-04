class WeighingMachine
  getter precision
  setter metric
  property weight

  def initialize(@precision : Int32, @metric : Bool)
    @weight = 0.0
  end

  # DO NOT MODIFY ANYTHING BELOW THIS LINE
  def weigh : String
    weight = @metric ? @weight : @weight * 2.20462
    weight = weight.round(@precision)
    weight.to_s
  end
end
