use regex_lite::Regex;

pub fn encode(source: &str) -> String {
    if source.is_empty() {
        return source.to_string();
    }

    let re = Regex::new(r"(\w|\s)\1*").unwrap();
    re.replace_all(source, |caps: &regex_lite::Captures<'_>| {
        let len = caps[0].len();
        let letter = caps[0].chars().next().unwrap();
        if len == 1 {
            letter.to_string()
        } else {
            format!("{len}{letter}")
        }
    })
    .into_owned()
}

pub fn decode(source: &str) -> String {
    let re = Regex::new(r"(\d+)(\w|\s)").unwrap();
    re.replace_all(source, |caps: &regex_lite::Captures<'_>| {
        let count: usize = caps[1].parse().unwrap();
        let letter = &caps[2];
        letter.repeat(count)
    })
    .into_owned()
}
