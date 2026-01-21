package collatzconjecture

import "errors"

func CollatzConjecture(n int) (steps int, err error) {
	if n < 1 {
		err = errors.New("can't be zero or negative")
	} else {
		for ; n != 1; steps++ {
			if n%2 == 0 {
				n /= 2
			} else {
				n = n*3 + 1
			}
		}
	}
	return steps, err
}
