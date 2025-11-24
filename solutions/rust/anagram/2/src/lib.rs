use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let sorted_base = sort_letters(&word.to_lowercase());

    possible_anagrams
        .iter()
        .copied()
        .filter(|&w| {
            let base = word.to_lowercase();
            let candidate = w.to_lowercase();
            candidate != base && sort_letters(&candidate) == sorted_base
        })
        .collect()
}

fn sort_letters(word: &str) -> String {
    let mut chars: Vec<char> = word.chars().collect();
    chars.sort();
    chars.into_iter().collect()
}
