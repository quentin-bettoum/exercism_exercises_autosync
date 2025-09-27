module KitchenCalculator
  extend self

  CONVERSION_UNITS = {
    :milliliter  => 1,
    :cup         => 240,
    :fluid_ounce => 30,
    :teaspoon    => 5,
    :tablespoon  => 15,
  }

  def get_volume(volume_pair)
    volume_pair[1]
  end

  def to_milliliter(volume_pair)
    unit, volume = volume_pair
    in_milliliter = volume * CONVERSION_UNITS[unit]
    {:milliliter, in_milliliter}
  end

  def from_milliliter(volume_pair, unit)
    converted_volume = volume_pair[1] / CONVERSION_UNITS[unit]
    {unit, converted_volume}
  end

  def convert(volume_pair, unit)
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
