package prime

func Factors(n int64) (primeFactors []int64) {
	var i int64 = 2
	for i <= n {
		if n%i == 0 {
			n = n / i
			primeFactors = append(primeFactors, int64(i))
		} else {
			i++
		}
	}

	return
}
