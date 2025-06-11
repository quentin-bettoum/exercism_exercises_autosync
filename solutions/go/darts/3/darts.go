package darts

import "math"

func Score(x, y float64) int {
	euclideanDistance := math.Hypot(x, y)
	switch {
	case euclideanDistance <= 1:
		return 10
	case euclideanDistance <= 5:
		return 5
	case euclideanDistance <= 10:
		return 1
	default:
		return 0
	}
}
