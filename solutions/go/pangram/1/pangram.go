package pangram

import "strings"

func IsPangram(input string) bool {
	letters := make(map[rune]struct{})

	for _, r := range strings.ToLower(input) {
		if r >= 'a' && r <= 'z' {
			letters[r] = struct{}{}
		}
	}

	return len(letters) == 26
}
