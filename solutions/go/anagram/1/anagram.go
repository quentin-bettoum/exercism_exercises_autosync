package anagram

import (
	"sort"
	"strings"
)

func Detect(subject string, candidates []string) (anagrams []string) {
	subject = strings.ToLower(subject)
	sortedSubjectLetters := sortedWordLetters(subject)
	for _, v := range candidates {
		lowerCaseWord := strings.ToLower(v)
		if lowerCaseWord != subject && sortedSubjectLetters == sortedWordLetters(lowerCaseWord) {
			anagrams = append(anagrams, v)
		}
	}

	return
}

func sortedWordLetters(word string) string {
	runes := []rune(strings.ToLower(word))
	sort.Slice(runes, func(i, j int) bool {
		return runes[i] < runes[j]
	})

	return string(runes)
}
