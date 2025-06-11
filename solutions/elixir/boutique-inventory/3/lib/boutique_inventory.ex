defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(is_nil(&1.price)))
  end

  def increase_quantity(item, count) do
    %{
      item |
      quantity_by_size: item.quantity_by_size
      |> Enum.into(%{}, fn {k, v} -> {k, v+count} end)
    }
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_size, qty}, acc -> acc + qty end)
  end
end
