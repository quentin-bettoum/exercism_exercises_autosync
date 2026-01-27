use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    if NUCLEOTIDES.contains(&nucleotide) {
        dna.chars()
            .find(|n| !NUCLEOTIDES.contains(n))
            .map_or_else(|| Ok(dna.chars().filter(|n| *n == nucleotide).count()), Err)
    } else {
        Err(nucleotide)
    }
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    dna.chars().find(|n| !NUCLEOTIDES.contains(n)).map_or_else(
        || Ok(NUCLEOTIDES.map(|n| (n, count(n, dna).unwrap())).into()),
        Err,
    )
}
