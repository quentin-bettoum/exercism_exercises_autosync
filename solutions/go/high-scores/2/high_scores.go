package highscores

import "slices"

type HighScores struct {
	scores []int
}

// NewHighScores returns a new HighScores object.
func NewHighScores(scores []int) *HighScores {
	return &HighScores{scores: scores}
}

// Scores returns all the scores.
func (s *HighScores) Scores() []int {
	return s.scores
}

// Latest returns the latest (last) score.
func (s *HighScores) Latest() int {
	return s.scores[len(s.scores)-1]
}

// PersonalBest returns the best (highest) score.
func (s *HighScores) PersonalBest() (highest int) {
	for _, v := range s.scores {
		if v > highest {
			highest = v
		}
	}

	return
}

// TopThree returns the top three scores.
func (s *HighScores) TopThree() []int {
	scores := make([]int, len(s.scores))
	copy(scores, s.scores)

	slices.SortFunc(scores, func(a, b int) int { return b - a })

	return scores[:min(3, len(scores))]
}
