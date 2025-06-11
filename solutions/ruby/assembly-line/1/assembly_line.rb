class AssemblyLine
  @@full_production_rate = 221

  def initialize(speed)
    @speed = speed
    @success_rate =
      if speed.zero?
        0
      elsif speed <= 4
        100
      elsif speed <= 8
        90
      elsif speed == 9
        80
      else
        77
      end
  end

  def production_rate_per_hour
    @@full_production_rate * @speed * @success_rate / 100.0
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
