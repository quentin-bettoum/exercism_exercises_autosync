use regex_lite::Regex;

pub fn abbreviate(phrase: &str) -> String {
    let re = Regex::new(r"[-\s_]+").unwrap();

    re.split(phrase)
        .map(|w| {
            let uppercase_letters = w
                .chars()
                .filter(|c| c.is_ascii_uppercase())
                .collect::<String>();
            let uppercase_letters_len = uppercase_letters.len();
            if uppercase_letters_len > 1 && uppercase_letters_len < w.len() {
                uppercase_letters
            } else {
                w.chars().next().unwrap().to_ascii_uppercase().to_string()
            }
        })
        .collect::<Vec<String>>()
        .concat()
}
