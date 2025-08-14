package sieve

import "slices"

func Sieve(limit int) (primes []int) {
	var notPrimes []int

	for i := 2; i <= limit; i++ {
		if slices.Contains(notPrimes, i) {
			continue
		}

		primes = append(primes, i)

		notPrimes = append(notPrimes, getMultiples(i, limit)...)
	}

	return
}

func getMultiples(n int, limit int) (multiples []int) {
	for i := n; i <= limit; i += n {
		multiples = append(multiples, i)
	}

	return
}
