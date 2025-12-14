#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    SpanTooLong,
    InvalidDigit(char),
}

pub fn lsp(string_digits: &str, span: usize) -> Result<u64, Error> {
    if span == 0 {
        Ok(1)
    } else if span > string_digits.len() {
        Err(Error::SpanTooLong)
    } else {
        match string_digits.chars().find(|c| !c.is_numeric()) {
            Some(char) => Err(Error::InvalidDigit(char)),
            None => Ok(string_digits
                .chars()
                .collect::<Vec<char>>()
                .windows(span)
                .map(|chars| {
                    chars
                        .iter()
                        .map(|c| c.to_digit(10).unwrap() as u64)
                        .product::<u64>()
                })
                .max()
                .unwrap()),
        }
    }
}
