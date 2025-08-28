const cooking_time = 40

const layer_time = 2

pub fn expected_minutes_in_oven() -> Int {
  cooking_time
}

pub fn remaining_minutes_in_oven(time: Int) -> Int {
  expected_minutes_in_oven() - time
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layer_time * layers
}

pub fn total_time_in_minutes(layers: Int, in_oven_time) -> Int {
  preparation_time_in_minutes(layers) + in_oven_time
}

pub fn alarm() -> String {
  "Ding!"
}
