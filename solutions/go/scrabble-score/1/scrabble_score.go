package scrabble

import "strings"

func Score(word string) (points int) {
	for _, char := range strings.ToLower(word) {
		if strings.ContainsRune("aeioulnrst", char) {
			points++
		} else if strings.ContainsRune("dg", char) {
			points += 2
		} else if strings.ContainsRune("bcmp", char) {
			points += 3
		} else if strings.ContainsRune("fhvwy", char) {
			points += 4
		} else if char == 'k' {
			points += 5
		} else if strings.ContainsRune("jx", char) {
			points += 8
		} else if strings.ContainsRune("qz", char) {
			points += 10
		}
	}

	return
}
