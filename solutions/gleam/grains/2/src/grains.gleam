import gleam/float
import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square >= 1 && square <= 64 {
    True -> {
      let assert Ok(result) =
        { square - 1 }
        |> int.to_float()
        |> int.power(2, _)

      Ok(float.round(result))
    }
    False -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  let assert Ok(result) = int.power(2, 64.0)

  float.round(result) - 1
}
