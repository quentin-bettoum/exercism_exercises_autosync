import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  count_order_price(order, fee)
}

fn count_order_price(order: List(Pizza), price: Int) -> Int {
  case order {
    [] -> price
    [pizza, ..rest] -> {
      let price = price + pizza_price(pizza)
      count_order_price(rest, price)
    }
  }
}
