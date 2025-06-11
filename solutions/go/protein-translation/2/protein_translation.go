package protein

import (
	"errors"
	"regexp"
)

var codons = map[string]string{
	"AUG": "Methionine",
	"UUU": "Phenylalanine", "UUC": "Phenylalanine",
	"UUA": "Leucine", "UUG": "Leucine",
	"UCU": "Serine", "UCC": "Serine", "UCA": "Serine", "UCG": "Serine",
	"UAU": "Tyrosine", "UAC": "Tyrosine",
	"UGU": "Cysteine", "UGC": "Cysteine",
	"UGG": "Tryptophan",
	"UAA": "STOP", "UAG": "STOP", "UGA": "STOP",
}
var ErrStop = errors.New("Stop codon detected")
var ErrInvalidBase = errors.New("Base is invalid")

func FromRNA(rna string) (sequence []string, err error) {
	codons := regexp.MustCompile(`.{3}`).FindAllString(rna, -1)
	for _, c := range codons {
		protein, codonErr := FromCodon(c)
		if codonErr != nil {
			if codonErr == ErrInvalidBase {
				err = ErrInvalidBase
			}
			return
		}
		sequence = append(sequence, protein)
	}

	return
}

func FromCodon(codon string) (protein string, err error) {
	protein, ok := codons[codon]
	if !ok {
		err = ErrInvalidBase
	} else if protein == "STOP" {
		err = ErrStop
	}
	return
}
