class Reactor
  def self.criticality_balanced?(temperature : Int, neutrons_emitted : Int) : Bool
    temperature < 800 && neutrons_emitted > 500 && temperature * neutrons_emitted < 500_000
  end

  def self.reactor_efficiency(voltage : Int, current : Int, theoretical_max_power : Int) : String
    generated_power = voltage * current
    efficiency = generated_power / theoretical_max_power * 100

    if efficiency >= 80
      "green"
    elsif efficiency >= 60
      "orange"
    elsif efficiency >= 30
      "red"
    else
      "black"
    end
  end

  def self.fail_safe(temperature : Int, neutrons_produced_per_second : Int, threshold : Int) : String
    criticality = temperature * neutrons_produced_per_second

    if percentage(criticality, threshold) < 90
      "LOW"
    elsif percentage(criticality, threshold) > 110
      "DANGER"
    else
      "NORMAL"
    end
  end

  private def self.percentage(a, b); a * 100 / b end
end
