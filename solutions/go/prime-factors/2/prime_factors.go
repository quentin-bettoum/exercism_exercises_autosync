package prime

func Factors(n int64) (primeFactors []int64) {
	for i := int64(2); i <= n; i++ {
		for n%i == 0 {
			n /= i
			primeFactors = append(primeFactors, i)
		}
	}

	return
}
