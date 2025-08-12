const dnaToRna: { [key: string]: string } = {
  'A': 'U',
  'C': 'G',
  'G': 'C',
  'T': 'A',
}

export function toRna(dna: string): string {
  return [...dna].map(c => {
    if (c in dnaToRna) return dnaToRna[c];
    throw new Error(`Invalid input DNA.`);
  }).join('');
}
