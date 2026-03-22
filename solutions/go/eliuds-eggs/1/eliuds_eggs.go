package eliudseggs

import "strconv"

func EggCount(displayValue int) (count int) {
	for _, r := range strconv.FormatInt(int64(displayValue), 2) {
		if r == '1' {
			count++
		}
	}

	return count
}
