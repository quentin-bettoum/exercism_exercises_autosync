package etl

import "strings"

func Transform(in map[int][]string) map[string]int {
	transformed := make(map[string]int)
	for score, letters := range in {
		for _, l := range letters {
			transformed[strings.ToLower(l)] = score
		}
	}
	return transformed
}
