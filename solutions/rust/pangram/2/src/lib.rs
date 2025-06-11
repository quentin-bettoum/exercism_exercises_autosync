use std::collections::HashSet;

/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    sentence
        .to_lowercase()
        .chars()
        .filter(|c| c.is_ascii_alphabetic())
        .collect::<HashSet<char>>()
        .len()
        .eq(&26)

    // let sentence_lowered = sentence.to_lowercase();
    // ('a'..='z').all(|ltr| sentence_lowered.contains(ltr))
}
