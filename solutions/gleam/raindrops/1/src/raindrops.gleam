// import gleam/dict
import gleam/int
import gleam/list
import gleam/string

const sounds = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(number: Int) -> String {
  let raindrops =
    list.fold(over: sounds, from: "", with: fn(acc, x) {
      let sound = case x {
        #(nbr, str) if number % nbr == 0 -> str
        _ -> ""
      }

      string.append(acc, sound)
    })

  case raindrops {
    "" -> int.to_string(number)
    _ -> raindrops
  }
}
