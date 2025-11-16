enum Nucleotide {
  A = 'A',
  C = 'C',
  G = 'G',
  T = 'T'
}

type NucleotideTally = { [key in Nucleotide]: number }

export function nucleotideCounts(dna_strand: string): NucleotideTally {
  const nucleotides = [...dna_strand]

  if (nucleotides.every(isNucleotide)) {
    return tally(nucleotides)
  }

  throw 'Invalid nucleotide in strand'
}

function isNucleotide(char: string): char is Nucleotide {
  return Object.values(Nucleotide).includes(char as Nucleotide)
}

function tally(nucleotides: Nucleotide[]): NucleotideTally {
  const tally: NucleotideTally = { A: 0, C: 0, G: 0, T: 0 }

  for (const n of nucleotides) {
    tally[n]++
  }

  return tally
}

// NOTE: Another solution using reduce
// function tally(nucleotides: Nucleotide[]): NucleotideTally {
//   return nucleotides.reduce((acc: NucleotideTally, n) => {
//     acc[n as Nucleotide]++
//     return acc
//   }, { A: 0, C: 0, G: 0, T: 0 })
// }

