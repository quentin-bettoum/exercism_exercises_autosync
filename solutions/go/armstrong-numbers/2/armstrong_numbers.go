package armstrong

import (
	"math"
	"strconv"
)

func IsNumber(n int) bool {
	digits := strconv.Itoa(n)
	exponent := len(digits)
	var sum int
	for _, d := range digits {
		sum += int(math.Pow(float64(d-'0'), float64(exponent)))
	}

	return sum == n
}
