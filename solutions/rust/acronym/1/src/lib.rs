pub fn abbreviate(phrase: &str) -> String {
    phrase
        .replace("-", " ")
        .replace("_", " ")
        .split_whitespace()
        .filter(|w| w.chars().next().unwrap().is_alphabetic())
        .map(|w| w.chars().next().unwrap().to_ascii_uppercase().to_string())
        .collect::<Vec<String>>()
        .concat()
}
