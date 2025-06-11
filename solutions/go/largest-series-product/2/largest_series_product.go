package lsproduct

import (
	"errors"
	"strconv"
	"unicode"
)

var ErrInputSmallerThanSpan = errors.New("span must be smaller than string length")
var ErrOnlyDigitsInput = errors.New("digits input must only contain digits")
var ErrNegativeSpan = errors.New("span must not be negative")

func LargestSeriesProduct(input string, span int) (largestProduct int64, err error) {
	if len(input) < span {
		return 0, ErrInputSmallerThanSpan
	}
	if span < 0 {
		return 0, ErrNegativeSpan
	}

	digits, err := stringToIntSlice(input)
	if err != nil {
		return 0, err
	}

	for i := 0; i < len(digits); i++ {
		if i+span > len(digits) {
			break
		}
		var product = digits[i]
		for x := 1; x < span; x++ {
			product *= digits[i+x]
		}

		if product > largestProduct {
			largestProduct = product
		}
	}

	return
}

func stringToIntSlice(number string) (digits []int64, err error) {
	for _, rune := range number {
		if !unicode.IsDigit(rune) {
			return digits, ErrOnlyDigitsInput
		}
		digit, _ := strconv.Atoi(string(rune))
		digits = append(digits, int64(digit))
	}
	return
}
