module KitchenCalculator
  @@conversion_units = {
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
    in_milliliter = volume * @@conversion_units[unit]
    {:milliliter, in_milliliter}
  end

  def self.from_milliliter(volume_pair, unit)
    converted_volume = volume_pair[1] / @@conversion_units[unit]
    {unit, converted_volume}
  end

  def self.convert(volume_pair, unit)
    self.from_milliliter(self.to_milliliter(volume_pair), unit)
  end
end
