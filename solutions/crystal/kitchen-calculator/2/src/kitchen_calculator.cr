module KitchenCalculator
  CONVERSION_UNITS = {
    :milliliter  => 1,
    :cup         => 240,
    :fluid_ounce => 30,
    :teaspoon    => 5,
    :tablespoon  => 15,
  }

  def self.get_volume(volume_pair)
    volume_pair[1]
  end

  def self.to_milliliter(volume_pair)
    unit, volume = volume_pair
    in_milliliter = volume * CONVERSION_UNITS[unit]
    {:milliliter, in_milliliter}
  end

  def self.from_milliliter(volume_pair, unit)
    converted_volume = volume_pair[1] / CONVERSION_UNITS[unit]
    {unit, converted_volume}
  end

  def self.convert(volume_pair, unit)
    self.from_milliliter(self.to_milliliter(volume_pair), unit)
  end
end
