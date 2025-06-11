pub fn check(candidate: &str) -> bool {
    let mut chars: Vec<char> = Vec::default();

    for c in candidate.to_lowercase().chars() {
        if !c.is_alphabetic() {
            continue;
        }
        if chars.contains(&c) {
            return false;
        }
        chars.push(c);
    }

    true
}
