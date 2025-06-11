package anagram

import (
	"sort"
	"strings"
)

func Detect(subject string, candidates []string) (anagrams []string) {
	lowerCaseSubject := strings.ToLower(subject)
	sortedSubjectLetters := sortedWordLetters(lowerCaseSubject)
	for _, v := range candidates {
		lowerCaseWord := strings.ToLower(v)
		if lowerCaseWord != lowerCaseSubject && sortedSubjectLetters == sortedWordLetters(lowerCaseWord) {
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
