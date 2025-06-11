package bottlesong

import (
	"fmt"
	"unicode"
)

type verse string

var numbersMapping = map[int]string{
	0:  "no",
	1:  "one",
	2:  "two",
	3:  "three",
	4:  "four",
	5:  "five",
	6:  "six",
	7:  "seven",
	8:  "eight",
	9:  "nine",
	10: "ten",
}

func Recite(startBottles, takeDown int) (verses []string) {
	stopBottles := startBottles - takeDown
	for i := startBottles; i > stopBottles; i-- {
		capitalized := fmt.Sprintf(
			"%s %s hanging on the wall,",
			capitalize(numbersMapping[i]),
			greenBottle(i),
		)

		verses = append(verses, capitalized)
		verses = append(verses, capitalized)
		verses = append(verses, "And if one green bottle should accidentally fall,")
		verses = append(verses, fmt.Sprintf("There'll be %s %s hanging on the wall.", numbersMapping[i-1], greenBottle(i-1)))
		if i-1 > stopBottles {
			verses = append(verses, "")
		}
	}

	return
}

func greenBottle(n int) string {
	if n == 1 {
		return "green bottle"
	}
	return "green bottles"
}

func capitalize(s string) string {
	r := []rune(s)
	r[0] = unicode.ToUpper(r[0])
	return string(r)
}
