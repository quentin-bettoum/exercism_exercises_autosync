let square_of_sum (n : int) : int = let sum = (1 + n) * n / 2 in sum * sum

let sum_of_squares (n : int) : int = n * (1 + n) * (2 * n + 1) / 6

let difference_of_squares (n : int) : int = square_of_sum(n) - sum_of_squares(n)
