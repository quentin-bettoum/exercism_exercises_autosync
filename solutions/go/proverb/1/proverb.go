// This is a "stub" file.  It's a little start on your solution.
// It's not a complete solution though; you have to write some code.

// Package proverb should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package proverb

import "fmt"

// Proverb should have a comment documenting it.
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
