class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |i| i[:name] }.sort
  end

  def cheap
    @items.filter { |i| i[:price] < 30 }
  end

  def out_of_stock
    @items.filter { |i| i[:quantity_by_size].count.zero? }
  end

  def stock_for_item(name)
    @items.find { |i| i[:name] == name }[:quantity_by_size]
  end

  def total_stock
    @items.reduce(0) { |acc, v| v[:quantity_by_size].values.sum + acc }
  end

  private

  attr_reader :items
end
