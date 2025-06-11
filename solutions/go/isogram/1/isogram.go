package isogram

import "strings"

func IsIsogram(word string) bool {
	runesCount := map[rune]int{}

	for _, rune := range strings.ToLower(word) {
		if rune == ' ' || rune == '-' {
			continue
		}

		if runesCount[rune] == 1 {
			return false
		}

		runesCount[rune]++
	}

	return true
}
