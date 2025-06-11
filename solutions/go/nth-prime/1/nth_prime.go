package prime

import "errors"

var ErrNoZero = errors.New("there is no zeroth prime")

// Nth returns the nth prime number. An error must be returned if the nth prime number can't be calculated ('n' is equal or less than zero)
func Nth(n int) (prime int, err error) {
	if n == 0 {
		return prime, ErrNoZero
	}

	var primeCount int
	for i := 0; primeCount < n; i++ {
		for x := 2; x <= i; x++ {
			if x < i && i%x == 0 {
				break
			}

			if x == i {
				prime = i
				primeCount++
			}
		}
	}

	return
}
