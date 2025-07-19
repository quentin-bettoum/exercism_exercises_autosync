// Package hamming calculate the hamming distance between two DNA strands
package hamming

import "errors"

var ErrDifferentLengthStrings = errors.New("can't calculate the distance for strings of different lengths")

func Distance(a, b string) (distance int, err error) {
	if len(a) != len(b) {
		err = ErrDifferentLengthStrings
		return
	}

	for i := 0; i < len(a); i++ {
		if a[i] != b[i] {
			distance++
		}
	}

	return
}
