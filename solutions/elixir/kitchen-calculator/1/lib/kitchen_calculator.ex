defmodule KitchenCalculator do
  @conversion_units %{
    :milliliter => 1,
    :cup => 240,
    :fluid_ounce => 30,
    :teaspoon => 5,
    :tablespoon => 15,
  }

  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({unit, volume}), do: {:milliliter, volume * @conversion_units[unit]}

  def from_milliliter({:milliliter, volume}, unit), do: {unit, volume / @conversion_units[unit]}

  def convert({from_unit, from_volume}, to_unit) do
    milliliter_volume = to_milliliter({from_unit, from_volume}) |> get_volume()
    from_milliliter({:milliliter, milliliter_volume}, to_unit)
  end
end
