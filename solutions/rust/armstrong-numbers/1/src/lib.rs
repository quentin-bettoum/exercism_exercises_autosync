pub fn is_armstrong_number(num: u32) -> bool {
    let num_str = num.to_string();
    let exp: u32 = num_str.len().try_into().unwrap();
    let mut sum: u32 = 0;

    for digit in num_str.chars() {
        sum += digit.to_digit(10).unwrap().pow(exp);
    }

    sum == num
}
