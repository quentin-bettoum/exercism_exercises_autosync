// Package bob determine what Bob will reply to someone when they say something to him or ask him a question
package bob

import (
	"regexp"
	"strings"
)

// Hey should determine what Bob will reply to a remark.
func Hey(remark string) string {
	trimedStr := strings.TrimSpace(remark)

	if trimedStr == "" {
		return "Fine. Be that way!"
	}

	hasCapitalLetters := regexp.MustCompile(`[A-Z]`).MatchString(trimedStr)
	hasDowncaseLetters := regexp.MustCompile(`[a-z]`).MatchString(trimedStr)
	hasOnlyCapitalLetters := hasCapitalLetters && !hasDowncaseLetters
	isQuestion := trimedStr[len(trimedStr)-1] == '?'

	if isQuestion {
		if hasOnlyCapitalLetters {
			return "Calm down, I know what I'm doing!"
		}
		return "Sure."
	} else if hasOnlyCapitalLetters {
		return "Whoa, chill out!"
	}

	return "Whatever."
}
