package sieve

import "slices"

func Sieve(limit int) (primes []int) {
	var notPrimes []int
	var numbers []int

	for i := 2; i <= limit; i++ {
		numbers = append(numbers, i)
	}

	for _, v := range numbers {
		if slices.Contains(notPrimes, v) {
			continue
		}

		primes = append(primes, v)

		for _, multiple := range getMultiples(v, limit) {
			notPrimes = append(notPrimes, multiple)
		}
	}

	return
}

func getMultiples(n int, limit int) (multiples []int) {
	for i := n; i <= limit; i += n {
		multiples = append(multiples, i)
	}

	return
}
