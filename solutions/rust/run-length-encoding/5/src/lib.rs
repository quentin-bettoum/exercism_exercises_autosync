use core::iter::from_fn;
use regex_lite::Regex;

pub fn encode(source: &str) -> String {
    let mut encoded = String::new();
    let mut iter = source.chars().peekable();
    while let Some(c) = iter.next() {
        match from_fn(|| iter.next_if_eq(&c)).count() {
            0 => encoded.push(c),
            n => encoded.push_str(&format!("{}{c}", n + 1)),
        }
    }
    encoded
}

pub fn decode(source: &str) -> String {
    let re = Regex::new(r"(\d+)(\w|\s)").unwrap();
    re.replace_all(source, |captures: &regex_lite::Captures<'_>| {
        let count: usize = captures[1].parse().unwrap();
        let letter = &captures[2];
        letter.repeat(count)
    })
    .into_owned()
}
