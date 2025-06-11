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

	for i, v := range isbn {
		var number int
		if i == 9 && unicode.ToLower(v) == 'x' {
			number = 10
		} else if !unicode.IsDigit(v) {
			return false
		} else {
			number = int(v - '0')
		}
		factor := 10 - i
		result += number * factor
	}

	return result%11 == 0
}
