pub fn square_of_sum(n: u32) -> u32 {
    // let sum = (1 + n) * n / 2;
    // sum * sum
    (1..=n).sum::<u32>().pow(2)
}

pub fn sum_of_squares(n: u32) -> u32 {
    // n * (1 + n) * (2 * n + 1) / 6
    (1..=n).map(|s| s.pow(2)).sum()
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
