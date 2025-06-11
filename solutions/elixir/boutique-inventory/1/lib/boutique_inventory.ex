defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort(&(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(is_nil(&1.price)))
  end

  def increase_quantity(item, count) do
    %{
      name: item.name,
      price: item.price,
      quantity_by_size: item.quantity_by_size
      |> Enum.map(fn {k, v} -> {k, v+count} end)
      |> Enum.into(item.quantity_by_size)
    }
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Map.values()
    |> Enum.reduce(0, &(&1+&2))
  end
end
