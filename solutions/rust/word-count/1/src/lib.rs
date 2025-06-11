use regex_lite::Regex;
use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let words = words.to_lowercase();
    let mut frequency: HashMap<String, u32> = HashMap::new();

    Regex::new(r"\w+('\w+)?")
        .unwrap()
        .find_iter(&words)
        .for_each(|word| {
            frequency
                .entry(word.as_str().to_owned())
                .and_modify(|c| *c += 1)
                .or_insert(1);
        });

    frequency
}
