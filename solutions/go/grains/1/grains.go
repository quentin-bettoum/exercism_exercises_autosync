package grains

import (
	"errors"
	"math"
)

func Square(number int) (count uint64, err error) {
	if number < 1 || number > 64 {
		err = errors.New("number can't be less than 1 or more than 64")
	} else {
		y := float64(number - 1)
		count = uint64(math.Pow(2, y))
	}
	return
}

func Total() uint64 {
	return math.MaxUint64
}
