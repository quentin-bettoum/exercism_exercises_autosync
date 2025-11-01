module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divisibleBy 400 || divisibleBy 4 && not (divisibleBy 100)
  where
    divisibleBy d = year `mod` d == 0
