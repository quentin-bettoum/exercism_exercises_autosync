// Package proverb generates proverbs.
package proverb

import "fmt"

// Proverb returns some proverbs using the rhymes passed.
func Proverb(rhyme []string) []string {
	rhymeCount := len(rhyme)
	text := make([]string, rhymeCount)
	if rhymeCount > 0 {
		for i, v := range rhyme {
			if i+1 == rhymeCount {
				text[i] = fmt.Sprintf("And all for the want of a %s.", rhyme[0])
			} else {
				text[i] = fmt.Sprintf("For want of a %s the %s was lost.", v, rhyme[i+1])
			}
		}
	}
	return text
}
