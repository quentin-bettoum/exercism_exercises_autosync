package prime

import (
	"errors"
	"math"
)

var ErrNoZero = errors.New("the nth number must be greater than 0")

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (int, error) {
	if n <= 0 {
		return 0, ErrNoZero
	}

	var primeCount int
	for i := 2; ; i++ {
		if isPrime(i) {
			primeCount++
			if primeCount == n {
				return i, nil
			}
		}
	}
}

func isPrime(n int) bool {
	if n == 2 {
		return true
	}
	if n < 2 || n%2 == 0 {
		return false
	}

	limit := int(math.Sqrt(float64(n)))
	for i := 3; i <= limit; i += 2 {
		if n%i == 0 {
			return false
		}
	}

	return true
}
