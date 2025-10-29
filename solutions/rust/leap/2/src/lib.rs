pub fn is_leap_year(year: u64) -> bool {
    let divisible_by4 = year % 4 == 0;
    let divisible_by100 = year % 100 == 0;
    let divisible_by400 = year % 400 == 0;

    divisible_by400 || divisible_by4 && !divisible_by100
}
