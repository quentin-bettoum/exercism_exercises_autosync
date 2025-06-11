local leap_year = function(number)
  local divisibleBy4 = number % 4 == 0
  local divisibleBy100 = number % 100 == 0
  local divisibleBy400 = number % 400 == 0

  return divisibleBy400 or divisibleBy4 and not divisibleBy100
end

return leap_year
