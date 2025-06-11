package parsinglogfiles

import "regexp"

func IsValidLine(text string) bool {
	return regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\]`).MatchString(text)

}

func SplitLogLine(text string) []string {
	return regexp.MustCompile(`<(~|\*|=|-)*>`).Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	var count int
	r := regexp.MustCompile(`(?i)".*?password.*?"`)

	for _, v := range lines {
		if r.MatchString(v) {
			count++
		}
	}

	return count
}

func RemoveEndOfLineText(text string) string {
	r := regexp.MustCompile(`end-of-line(\d*)`)
	return r.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	r := regexp.MustCompile(`User\s+(\w+)`)
	taggedLines := lines
	for i, v := range lines {
		if r.MatchString(v) {
			taggedLines[i] = "[USR] " + r.FindStringSubmatch(v)[1] + " " + taggedLines[i]
		}
	}
	return taggedLines
}
