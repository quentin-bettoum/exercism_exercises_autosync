// Package parallelletterfrequency counts letter frequency
package parallelletterfrequency

import (
	"sync"
	"unicode"
)

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}

	for _, r := range text {
		if unicode.IsLetter(r) {
			frequencies[unicode.ToLower(r)]++
		}
	}

	return frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	ch := make(chan FreqMap, len(texts))

	var wg sync.WaitGroup
	for _, text := range texts {
		wg.Go(func() {
			ch <- Frequency(text)
		})
	}
	wg.Wait()

	frequencies := FreqMap{}

	for range texts {
		for r, count := range <-ch {
			frequencies[r] += count
		}
	}

	return frequencies
}
