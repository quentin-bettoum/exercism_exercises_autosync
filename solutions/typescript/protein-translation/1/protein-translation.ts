const CODONS_REGEXP = /.{1,3}/g

export type Codon = 'AUG' | 'UUU' | 'UUC' | 'UUA' | 'UUG' | 'UCU' | 'UCC' | 'UCA' | 'UCG' | 'UAU' | 'UAC' | 'UGU' | 'UGC' | 'UGG' | 'UAA' | 'UAG' | 'UGA'
export type AminoAcid = 'Methionine' | 'Phenylalanine' | 'Leucine' | 'Serine' | 'Tyrosine' | 'Cysteine' | 'Tryptophan'
export type Protein = AminoAcid[]

/**
 * Translates an RNA sequence into a chain of amino acids which forms a protein.
 *
 * @param rna - The RNA sequence to translate
 * @returns Array of amino acids names (e.g., ['Methionine', 'Phenylalanine'])
 * @throws {Error} If RNA contains invalid codons or is incomplete
 *
 * @example
 * translate('AUGUUUUGG') // ['Methionine', 'Phenylalanine', 'Tryptophan']
 * translate('AUGUAAUUU') // ['Methionine'] (stops at UAA)
 */
export function translate(rna: string): Protein {
  const protein: Protein = []

  for (const codon of rna.matchAll(CODONS_REGEXP)) {
    const aminoAcid: AminoAcid | null = aminoAcidFromCodon(codon[0])
    if (aminoAcid === null) break
    protein.push(aminoAcid)
  }

  return protein
}

/**
 * Translates an RNA codon to its corresponding amino acid.
 *
 * Stop codons (UAA, UAG, UGA) return `null` to signal translation termination.
 *
 * @param codon - A string that should be a valid RNA codon triplet (e.g., 'AUG', 'UUU').
 * @returns The amino acid name (e.g., 'Methionine'), or `null` for stop codons.
 * @throws {Error} If the codon is invalid.
 */
function aminoAcidFromCodon(codon: string): AminoAcid | null {
  switch (codon as Codon) {
    case 'AUG': return 'Methionine'
    case 'UUU':
    case 'UUC': return 'Phenylalanine'
    case 'UUA':
    case 'UUG': return 'Leucine'
    case 'UCU':
    case 'UCC':
    case 'UCA':
    case 'UCG': return 'Serine'
    case 'UAU':
    case 'UAC': return 'Tyrosine'
    case 'UGU':
    case 'UGC': return 'Cysteine'
    case 'UGG': return 'Tryptophan'
    case 'UAA':
    case 'UAG':
    case 'UGA': return null
    default: throw new Error("Invalid codon")
  }
}
