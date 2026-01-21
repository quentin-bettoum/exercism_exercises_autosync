pub fn is_leap_year(year: u64) -> bool {
    let divisible_by4 = year.is_multiple_of(4);
    let divisible_by100 = year.is_multiple_of(100);
    let divisible_by400 = year.is_multiple_of(400);

    divisible_by400 || divisible_by4 && !divisible_by100
}
