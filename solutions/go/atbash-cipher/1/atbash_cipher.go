package atbash

import (
	"strings"
	"unicode"
)

func Atbash(s string) (output string) {
	s = strings.ToLower(s)
	count := 0
	for _, r := range s {
		if unicode.IsSpace(r) || unicode.IsPunct(r) {
			continue
		}
		if count == 5 {
			output = output + " "
			count = 0
		}
		count++

		output = output + string(invertLetter(r))
	}

	return
}

func invertLetter(r rune) rune {
	if r >= 'a' && r <= 'z' {
		return 'a' - (r - 'z')
	} else if unicode.IsNumber(r) {
		return r
	}
	return 0
}
