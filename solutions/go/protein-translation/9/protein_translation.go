package proteintranslation

import (
	"errors"
	"regexp"
)

var (
	ErrStop        = errors.New("stop codon detected")
	ErrInvalidBase = errors.New("base is invalid")
	codonRegex     = regexp.MustCompile(`.{1,3}`)
)

type (
	Codon     = string
	AminoAcid = string
	Protein   = []AminoAcid
)

func FromRNA(rna string) (protein Protein, _ error) {
	for _, c := range codonRegex.FindAllString(rna, -1) {
		aminoAcid, err := FromCodon(c)
		if errors.Is(err, ErrStop) {
			return protein, nil
		}
		if err != nil {
			return nil, err
		}
		protein = append(protein, aminoAcid)
	}

	return
}

func FromCodon(codon Codon) (aminoAcid AminoAcid, err error) {
	switch codon {
	case "AUG":
		aminoAcid = "Methionine"
	case "UUU", "UUC":
		aminoAcid = "Phenylalanine"
	case "UUA", "UUG":
		aminoAcid = "Leucine"
	case "UCU", "UCC", "UCA", "UCG":
		aminoAcid = "Serine"
	case "UAU", "UAC":
		aminoAcid = "Tyrosine"
	case "UGU", "UGC":
		aminoAcid = "Cysteine"
	case "UGG":
		aminoAcid = "Tryptophan"
	case "UAA", "UAG", "UGA":
		err = ErrStop
	default:
		err = ErrInvalidBase
	}

	return
}
