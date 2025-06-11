package romannumerals

import (
	"errors"
	"sort"
	"strings"
)

var numeralValues = map[int]string{
	1:    "I",
	4:    "IV",
	5:    "V",
	9:    "IX",
	10:   "X",
	40:   "XL",
	50:   "L",
	90:   "XC",
	100:  "C",
	400:  "CD",
	500:  "D",
	900:  "CM",
	1000: "M",
}

func ToRomanNumeral(input int) (romanNumeral string, err error) {
	if input > 3999 || input < 1 {
		err = errors.New("Input number should be more than 0 and less than 4000")
		return
	}

	keys := make([]int, 0, len(numeralValues))
	for k := range numeralValues {
		keys = append(keys, k)
	}

	sort.Slice(keys, func(i, j int) bool {
		return keys[i] > keys[j]
	})

	for _, v := range keys {
		if input >= v {
			romanNumeral += strings.Repeat(numeralValues[v], input/v)
			input -= v * (input / v)
		}
	}

	return
}
