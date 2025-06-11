package luhn

import (
	"slices"
	"strings"
	"unicode"
)

func Valid(id string) bool {
	id = strings.ReplaceAll(id, " ", "")

	if len(id) <= 1 {
		return false
	}

	var count int
	runes := []rune(id)
	slices.Reverse(runes)

	for i, r := range runes {
		if !unicode.IsDigit(r) {
			return false
		}

		// NOTE: convert rune to int by substracting to the 0 rune ascii number
		// For example: int('2') = 50, int('0') = 48, 50 - 48 = 2
		number := int(r - '0')

		if i%2 != 0 {
			number *= 2
			if number > 9 {
				number -= 9
			}
		}
		count += number
	}

	return count%10 == 0
}
