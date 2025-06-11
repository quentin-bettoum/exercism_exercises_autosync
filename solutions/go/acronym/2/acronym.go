// Package acronym handle acronyms
package acronym

import (
	"regexp"
	"strings"
)

// Abbreviate generates an acronym from a string.
func Abbreviate(s string) (acronym string) {
	words := regexp.MustCompile(`[a-zA-Z']+`).FindAllString(s, -1)

	for _, w := range words {
		acronym += string(w[0])
	}

	return strings.ToUpper(acronym)
}
