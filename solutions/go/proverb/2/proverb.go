// Package proverb generates proverbs.
package proverb

import "fmt"

// Proverb returns some proverbs using the rhymes passed.
func Proverb(rhyme []string) []string {
	rhyme_count := len(rhyme)
	text := make([]string, rhyme_count)
	if rhyme_count > 0 {
		for i, v := range rhyme {
			if i+1 == rhyme_count {
				text[i] = fmt.Sprintf("And all for the want of a %s.", rhyme[0])
			} else {
				text[i] = fmt.Sprintf("For want of a %s the %s was lost.", v, rhyme[i+1])
			}
		}
	}
	return text
}
