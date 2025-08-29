import gleam/float
import gleam/int
import gleam/result
import gleam/string

pub fn pence_to_pounds(pence: Int) -> Float {
  pence
  |> int.to_float()
  |> float.divide(100.0)
  |> result.unwrap(0.0)
}

pub fn pounds_to_string(pounds: Float) -> String {
  pounds
  |> float.to_string
  |> string.append(to: "£", suffix: _)
}
