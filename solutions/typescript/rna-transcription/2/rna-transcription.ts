const dnaToRna: { [key: string]: string } = {
  'A': 'U',
  'C': 'G',
  'G': 'C',
  'T': 'A',
}

function invalidInput() {
  throw new Error('Invalid input DNA.')
}

export function toRna(dna: string): string {
  return [...dna]
    .map(c => dnaToRna[c] || invalidInput())
    .join('')
}
