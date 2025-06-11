package pangram

import "strings"

func IsPangram(input string) bool {
	input = strings.ToLower(input)
	for r := 'a'; r <= 'z'; r++ {
		if !strings.ContainsRune(input, r) {
			return false
		}
	}

	return true
}

// func IsPangram(input string) bool {
// 	letters := make(map[rune]struct{})

// 	for _, r := range strings.ToLower(input) {
// 		if r >= 'a' && r <= 'z' {
// 			letters[r] = struct{}{}
// 		}
// 	}

// 	return len(letters) == 26
// }
