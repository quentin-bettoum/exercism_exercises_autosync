module main

// is_leap_year returns true if the given year is a leap year in the Gregorian calendar
fn is_leap_year(year int) bool {
	divisible_by_4 := year % 4 == 0
	divisible_by_100 := year % 100 == 0
	divisible_by_400 := year % 400 == 0

	return divisible_by_400 || (divisible_by_4 && !divisible_by_100)
}
