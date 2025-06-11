package darts

import "math"

func Score(x, y float64) int {
	euclideanDistance := math.Sqrt(math.Pow(x, 2) + math.Pow(y, 2))
	switch {
	case euclideanDistance >= -1 && euclideanDistance <= 1:
		return 10
	case euclideanDistance >= -5 && euclideanDistance <= 5:
		return 5
	case euclideanDistance >= -10 && euclideanDistance <= 10:
		return 1
	default:
		return 0
	}
}
