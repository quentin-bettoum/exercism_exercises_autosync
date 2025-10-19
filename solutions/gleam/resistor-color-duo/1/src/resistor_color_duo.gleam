import gleam/int
import gleam/list

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case list.length(colors) {
    l if l < 2 -> Error(Nil)
    _ -> colors |> list.take(2) |> list.map(code) |> int.undigits(10)
  }
}

fn code(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}
