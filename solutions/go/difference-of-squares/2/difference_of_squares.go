package diffsquares

func SquareOfSum(n int) int {
	sum := (1 + n) * n / 2
	return sum * sum
}

func SumOfSquares(n int) (result int) {
	return n * (1 + n) * (2*n + 1) / 6
}

func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
