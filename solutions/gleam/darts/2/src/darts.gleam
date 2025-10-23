import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  let assert Ok(euclidean_distance) = float.square_root(x *. x +. y *. y)

  case euclidean_distance {
    x if x <=. 1.0 -> 10
    x if x <=. 5.0 -> 5
    x if x <=. 10.0 -> 1
    _ -> 0
  }
}
