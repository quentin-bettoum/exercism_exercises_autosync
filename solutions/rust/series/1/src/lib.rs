pub fn series(digits: &str, len: usize) -> Vec<String> {
    digits
        .as_bytes()
        .windows(len)
        .map(|b| std::str::from_utf8(b).unwrap().to_string())
        .collect()
}
