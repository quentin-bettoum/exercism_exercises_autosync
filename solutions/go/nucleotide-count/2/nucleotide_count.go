package dna

import "errors"

type Nucleotide rune
type Histogram map[Nucleotide]int
type DNA string

var ErrInvalidNucleotide = errors.New("The DNA contains at least one unexpected nucleotide.")

func (d DNA) Counts() (Histogram, error) {
	h := Histogram{}.New()

	for _, r := range d {
		n := Nucleotide(r)
		_, isValid := h[n]
		if !isValid {
			return h, ErrInvalidNucleotide
		}
		h[n]++
	}

	return h, nil
}

func (h Histogram) New() Histogram {
	return Histogram{
		'A': 0,
		'C': 0,
		'G': 0,
		'T': 0,
	}
}
