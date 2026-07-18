import gleam/int
import gleam/list
import gleam/order

pub opaque type CircularBuffer(t) {
  CircularBuffer(capacity: Int, data: List(t))
}

pub fn new(capacity: Int) -> CircularBuffer(t) {
  CircularBuffer(capacity:, data: [])
}

pub fn read(buffer: CircularBuffer(t)) -> Result(#(t, CircularBuffer(t)), Nil) {
  case buffer.data {
    [] -> Error(Nil)
    [item, ..data] -> Ok(#(item, CircularBuffer(..buffer, data:)))
  }
}

pub fn write(
  buffer: CircularBuffer(t),
  item: t,
) -> Result(CircularBuffer(t), Nil) {
  case has_available_space(buffer) {
    True -> {
      Ok(CircularBuffer(..buffer, data: list.append(buffer.data, [item])))
    }
    False -> Error(Nil)
  }
}

pub fn overwrite(buffer: CircularBuffer(t), item: t) -> CircularBuffer(t) {
  case has_available_space(buffer) {
    True -> {
      let assert Ok(buffer) = write(buffer, item)
      buffer
    }
    False -> {
      let assert Ok(#(_, buffer)) = read(buffer)
      let assert Ok(buffer) = write(buffer, item)

      buffer
    }
  }
}

pub fn clear(buffer: CircularBuffer(t)) -> CircularBuffer(t) {
  new(buffer.capacity)
}

fn has_available_space(buffer: CircularBuffer(t)) -> Bool {
  buffer.data
  |> list.length
  |> int.compare(buffer.capacity)
  == order.Lt
}
