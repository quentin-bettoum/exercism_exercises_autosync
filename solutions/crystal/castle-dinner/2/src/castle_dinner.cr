module CastleDinner
  extend self

  def check_food?(food)
    food == "Mushroom pasties" ? food : nil
  end

  def check_drink?(drink)
    drink.downcase.includes?('i') ? drink : nil
  end

  def replace_drink(drink)
    check_drink?(drink) || "Apple juice"
  end
end
