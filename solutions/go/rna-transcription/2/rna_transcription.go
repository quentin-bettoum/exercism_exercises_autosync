package strand

import "strings"

var dnaToRnaMap = map[rune]rune{
	'A': 'U',
	'C': 'G',
	'G': 'C',
	'T': 'A',
}

func ToRNA(dna string) (rna string) {
	return strings.Map(func(n rune) rune { return dnaToRnaMap[n] }, dna)
}
