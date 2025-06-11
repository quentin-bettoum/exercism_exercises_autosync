// Package bob determine what Bob will reply to someone when they say something to him or ask him a question
package bob

import (
	"regexp"
	"strings"
)

// Hey should determine what Bob will reply to a remark.
func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	if remark == "" {
		return "Fine. Be that way!"
	}

	hasCapitalLetters := regexp.MustCompile(`[A-Z]`).MatchString(remark)
	hasDowncaseLetters := regexp.MustCompile(`[a-z]`).MatchString(remark)
	hasOnlyCapitalLetters := hasCapitalLetters && !hasDowncaseLetters
	isQuestion := strings.HasSuffix(remark, "?")

	switch true {
	case isQuestion && hasOnlyCapitalLetters:
		return "Calm down, I know what I'm doing!"
	case isQuestion:
		return "Sure."
	case hasOnlyCapitalLetters:
		return "Whoa, chill out!"
	default:
		return "Whatever."
	}
}
