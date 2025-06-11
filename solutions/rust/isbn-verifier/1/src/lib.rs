/// Determines whether the supplied string is a valid ISBN number
pub fn is_valid_isbn(isbn: &str) -> bool {
    let isbn = &isbn.replace("-", "");

    if isbn.len() != 10 {
        return false;
    }

    let mut result: usize = 0;

    for (i, v) in isbn.chars().enumerate() {
        let number: usize;

        if i == 9 && v.to_lowercase().to_string() == "x" {
            number = 10;
        } else if !v.is_ascii_digit() {
            return false;
        } else {
            number = v.to_digit(10).unwrap() as usize;
        }

        let factor = 10 - i;
        result += number * factor;
    }

    result % 11 == 0
}
