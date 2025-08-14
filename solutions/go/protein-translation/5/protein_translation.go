package protein

import (
	"errors"
	"regexp"
)

var (
	ErrStop        = errors.New("stop codon detected")
	ErrInvalidBase = errors.New("base is invalid")
)

func FromRNA(rna string) (sequence []string, err error) {
	var protein string
	codons := regexp.MustCompile(`.{3}`).FindAllString(rna, -1)

	for _, c := range codons {
		protein, err = FromCodon(c)
		if err != nil {
			if err != ErrInvalidBase {
				err = nil
			}
			return
		}
		sequence = append(sequence, protein)
	}

	return
}

func FromCodon(codon string) (protein string, err error) {
	switch codon {
	case "AUG":
		protein = "Methionine"
	case "UUU", "UUC":
		protein = "Phenylalanine"
	case "UUA", "UUG":
		protein = "Leucine"
	case "UCU", "UCC", "UCA", "UCG":
		protein = "Serine"
	case "UAU", "UAC":
		protein = "Tyrosine"
	case "UGU", "UGC":
		protein = "Cysteine"
	case "UGG":
		protein = "Tryptophan"
	case "UAA", "UAG", "UGA":
		err = ErrStop
	default:
		err = ErrInvalidBase
	}

	return
}
