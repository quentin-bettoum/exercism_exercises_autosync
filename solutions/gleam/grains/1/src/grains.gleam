import gleam/float
import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square {
    x if x >= 1 && x <= 64 -> {
      let assert Ok(result) =
        { square - 1 }
        |> int.to_float()
        |> int.power(2, _)

      Ok(float.round(result))
    }
    _ -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  let assert Ok(result) = int.power(2, 64.0)

  float.round(result) - 1
}
