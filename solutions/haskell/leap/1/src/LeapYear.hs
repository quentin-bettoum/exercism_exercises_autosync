module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divisibleBy400 || (divisibleBy4 && not divisibleBy100)
  where
    divisibleBy4  = mod year 4   == 0
    divisibleBy100 = mod year 100 == 0
    divisibleBy400 = mod year 400 == 0
