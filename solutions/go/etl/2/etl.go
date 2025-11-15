package etl

import "strings"

type (
	OldScore = map[int][]string
	NewScore = map[string]int
)

func Transform(in OldScore) NewScore {
	transformed := make(NewScore)
	for score, letters := range in {
		for _, l := range letters {
			transformed[strings.ToLower(l)] = score
		}
	}
	return transformed
}
