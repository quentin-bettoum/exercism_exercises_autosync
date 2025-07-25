defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &is_nil(&1.price))
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Enum.into(item.quantity_by_size, %{}, fn {k, v} -> {k, v+count} end)}
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)

    # Enum.map(inventory, fn item -> Map.update!(item, :name, &String.replace(&1, old_word, new_word)) end)
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_size, qty}, acc -> acc + qty end)
  end
end
