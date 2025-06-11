class AssemblyLine
  FULL_PRODUCTION_RATE = 221

  def initialize(speed)
    @speed = speed
  end

  def success_rate
    case @speed
    when 10
      0.77
    when 9
      0.8
    when 5..8
      0.9
    when 1..4
      1
    else
      0
    end
  end

  def production_rate_per_hour
    FULL_PRODUCTION_RATE * @speed * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
