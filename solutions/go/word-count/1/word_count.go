package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	freq := make(Frequency)

	for _, v := range regexp.MustCompile(`[^\w']+`).Split(phrase, -1) {
		word := strings.Trim(v, "'")
		if word != "" {
			freq[strings.ToLower(word)]++
		}
	}

	return freq
}
