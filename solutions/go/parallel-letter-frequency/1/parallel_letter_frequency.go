// Package letter counts letter frequency
package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(text string) FreqMap {
	frequencies := FreqMap{}

	for _, r := range text {
		frequencies[r]++
	}

	return frequencies
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(texts []string) FreqMap {
	ch := make(chan FreqMap, len(texts))

	for _, text := range texts {
		go func(t string) {
			ch <- Frequency(t)
		}(text)
	}

	frequencies := FreqMap{}

	for range texts {
		for r, count := range <-ch {
			frequencies[r] += count
		}
	}

	return frequencies
}
