package strand

var dnaToRnaMap = map[rune]string{
	'A': "U",
	'C': "G",
	'G': "C",
	'T': "A",
}

func ToRNA(dna string) (rna string) {
	for _, v := range dna {
		rna += dnaToRnaMap[v]
	}

	return
}
