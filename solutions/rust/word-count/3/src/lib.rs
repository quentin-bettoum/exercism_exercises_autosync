use regex_lite::Regex;
use std::{collections::HashMap, sync::LazyLock};

static WORD_REGEXP: LazyLock<regex_lite::Regex> =
    LazyLock::new(|| Regex::new(r"\w+('\w+)?").unwrap());

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let words = words.to_lowercase();

    WORD_REGEXP
        .find_iter(&words)
        .fold(HashMap::new(), |mut frequencies, word| {
            frequencies
                .entry(word.as_str().to_owned())
                .and_modify(|c| *c += 1)
                .or_insert(1);

            frequencies
        })
}
