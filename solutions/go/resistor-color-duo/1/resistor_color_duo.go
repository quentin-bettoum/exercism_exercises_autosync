package resistorcolorduo

import (
	"fmt"
	"strconv"
)

var colorsMapping = map[string]int{
	"black":  0,
	"brown":  1,
	"red":    2,
	"orange": 3,
	"yellow": 4,
	"green":  5,
	"blue":   6,
	"violet": 7,
	"grey":   8,
	"white":  9,
}

// Value should return the resistance value of a resistor with a given colors.
func Value(colors []string) int {
	concatValues := fmt.Sprintf("%d%d", colorsMapping[colors[0]], colorsMapping[colors[1]])
	int, _ := strconv.Atoi(concatValues)
	return int
}
