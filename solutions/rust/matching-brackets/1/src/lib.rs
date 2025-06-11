use std::{collections::HashMap, sync::LazyLock};

static BRACKETS: LazyLock<HashMap<char, char>> =
    LazyLock::new(|| HashMap::from([('[', ']'), ('{', '}'), ('(', ')')]));
static BRACKETS_REVERSED: LazyLock<HashMap<char, char>> =
    LazyLock::new(|| BRACKETS.iter().map(|(&k, &v)| (v, k)).collect());
static OPENING_BRACKETS: LazyLock<Vec<char>> = LazyLock::new(|| BRACKETS.keys().cloned().collect());
static CLOSING_BRACKETS: LazyLock<Vec<char>> =
    LazyLock::new(|| BRACKETS.values().cloned().collect());

pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = vec![];

    for c in string.chars() {
        if CLOSING_BRACKETS.contains(&c) {
            if stack.last() == BRACKETS_REVERSED.get(&c) {
                stack.pop();
            } else {
                return false;
            }
        } else if OPENING_BRACKETS.contains(&c) {
            stack.push(c);
        }
    }

    stack.is_empty()
}
