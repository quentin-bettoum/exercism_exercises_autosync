pub fn raindrops(n: u32) -> String {
    let mut str: String = String::new();

    if n % 3 == 0 {
        str += "Pling";
    }
    if n % 5 == 0 {
        str += "Plang";
    }
    if n % 7 == 0 {
        str += "Plong";
    }

    if str.is_empty() { n.to_string() } else { str }
}
