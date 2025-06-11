package isbn

import (
	"strings"
	"unicode"
)

func IsValidISBN(isbn string) bool {
	isbn = strings.ReplaceAll(isbn, "-", "")
	if len(isbn) != 10 {
		return false
	}

	var result int
	var factor int = 10

	for _, v := range isbn {
		var number int
		if factor == 1 && unicode.ToLower(v) == 'x' {
			number = 10
		} else if !unicode.IsDigit(v) {
			return false
		} else {
			number = int(v - '0')
		}
		result += number * factor
		factor--
	}

	return result%11 == 0
}
