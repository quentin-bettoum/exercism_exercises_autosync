use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let mut chars = HashSet::new();

    for c in candidate.to_lowercase().chars() {
        if c.is_alphabetic() && !chars.insert(c) {
            return false;
        }
    }

    true

    //     candidate
    //         .to_lowercase()
    //         .chars()
    //         .filter(|c| c.is_alphabetic())
    //         .all(|c| chars.insert(c))
}
