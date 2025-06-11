package dna

import (
	"errors"
	"unicode"
)

type Nucleotide rune
type Histogram map[Nucleotide]int
type DNA string

var ErrInvalidNucleotide = errors.New("The DNA contains at least one unexpected nucleotide.")

func (d DNA) Counts() (Histogram, error) {
	h := Histogram{}.New()

	for _, r := range d {
		n := Nucleotide(r)
		if !n.Valid() {
			return h, ErrInvalidNucleotide
		}
		h[n]++
	}

	return h, nil
}

func (n Nucleotide) Valid() bool {
	r := unicode.ToUpper(rune(n))
	return r == 'A' || r == 'C' || r == 'G' || r == 'T'
}

func (h Histogram) New() Histogram {
	return Histogram{
		'A': 0,
		'C': 0,
		'G': 0,
		'T': 0,
	}
}
