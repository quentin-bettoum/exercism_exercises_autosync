pub type TreasureChest(a) {
  TreasureChest(String, a)
}

pub type UnlockResult(t) {
  Unlocked(t)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  let TreasureChest(pass, treasure) = chest

  case pass == password {
    True -> Unlocked(treasure)
    False -> WrongPassword
  }
}
