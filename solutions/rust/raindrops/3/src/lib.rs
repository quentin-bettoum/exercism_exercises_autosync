pub fn raindrops(n: u32) -> String {
    let mut str: String = String::new();

    if n.is_multiple_of(3) {
        str += "Pling";
    }
    if n.is_multiple_of(5) {
        str += "Plang";
    }
    if n.is_multiple_of(7) {
        str += "Plong";
    }

    if str.is_empty() { n.to_string() } else { str }
}
