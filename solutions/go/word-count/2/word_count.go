package wordcount

import (
	"regexp"
	"strings"
)

type Frequency map[string]int

func WordCount(phrase string) Frequency {
	phrase = strings.ToLower(phrase)
	freq := make(Frequency)

	for _, word := range regexp.MustCompile(`\w+('\w+)?`).FindAllString(phrase, -1) {
		freq[word]++
	}

	return freq
}
