pub fn rotate(input: &str, key: u8) -> String {
    input
        .bytes() // Since we only deal with ASCII letters, I chose to use bytes directly
        .map(|b| shift_byte(b, key))
        .map(|b| b as char)
        .collect()
}

fn shift_byte(letter: u8, shift: u8) -> u8 {
    match letter {
        b'A'..=b'Z' => rotate_byte(letter, b'A', shift),
        b'a'..=b'z' => rotate_byte(letter, b'a', shift),
        _ => letter,
    }
}

fn rotate_byte(letter: u8, base: u8, shift: u8) -> u8 {
    base + (letter - base + shift) % 26
}
