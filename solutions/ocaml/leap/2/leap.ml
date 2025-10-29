let leap_year year =
  let divisible_by4 = year mod 4 = 0 in
  let divisible_by100 = year mod 100 = 0 in
  let divisible_by400 = year mod 400 = 0 in

  divisible_by400 || (divisible_by4 && not divisible_by100)
