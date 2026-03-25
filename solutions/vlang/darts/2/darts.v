module main

import math

fn score(x f64, y f64) int {
	euclidean_distance := math.hypot(x, y)

	return match true {
		euclidean_distance <= 1 { 10 }
		euclidean_distance <= 5 { 5 }
		euclidean_distance <= 10 { 1 }
		else { 0 }
	}
}
