/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let id = code.replace(" ", "");

    if id.len() <= 1 {
        return false;
    }

    let mut count: u32 = 0;

    for (index, c) in (0_u16..).zip(id.chars().rev()) {
        match c.to_digit(10) {
            Some(d) => {
                let mut digit = d;
                if index % 2 != 0 {
                    digit *= 2;
                    if digit > 9 {
                        digit -= 9;
                    }
                }
                count += digit;
            }
            None => return false,
        };
    }

    count.is_multiple_of(10)
}
