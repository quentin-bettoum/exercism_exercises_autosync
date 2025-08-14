#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(u32),
}

///
/// Convert a number between two bases.
///
/// A number is any slice of digits.
/// A digit is any unsigned integer (e.g. u8, u16, u32, u64, or usize).
/// Bases are specified as unsigned integers.
///
/// Return the corresponding Error enum if the conversion is impossible.
///
///
/// You are allowed to change the function signature as long as all test still pass.
///
///
/// Example:
/// Input
///   number: &[4, 2]
///   from_base: 10
///   to_base: 2
/// Result
///   Ok(vec![1, 0, 1, 0, 1, 0])
///
/// The example corresponds to converting the number 42 from decimal
/// which is equivalent to 101010 in binary.
///
///
/// Notes:
///  * The empty slice ( "[]" ) is equal to the number 0.
///  * Never output leading 0 digits, unless the input number is 0, in which the output must be `[0]`.
///    However, your function must be able to process input with leading 0 digits.
///
pub fn convert(number: &[u32], from_base: u32, to_base: u32) -> Result<Vec<u32>, Error> {
    if from_base < 2 {
        return Err(Error::InvalidInputBase);
    }
    if to_base < 2 {
        return Err(Error::InvalidOutputBase);
    }

    for &d in number {
        if d >= from_base {
            return Err(Error::InvalidDigit(d));
        }
    }

    if number.is_empty() || number.iter().all(|&d| d == 0) {
        return Ok(vec![0]);
    }

    let mut digits: Vec<u32> = number.to_vec();
    let mut result: Vec<u32> = Vec::new();

    while !digits.is_empty() {
        let mut quotient: Vec<u32> = Vec::new();
        let mut carry: u128 = 0;
        for &d in &digits {
            let acc = carry * (from_base as u128) + (d as u128);
            let q = (acc / (to_base as u128)) as u32;
            carry = acc % (to_base as u128);
            if !quotient.is_empty() || q != 0 {
                quotient.push(q);
            }
        }
        result.push(carry as u32);
        digits = quotient;
    }

    result.reverse();
    Ok(result)
}
