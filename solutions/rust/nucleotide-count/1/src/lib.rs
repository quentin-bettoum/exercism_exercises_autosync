use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    if !NUCLEOTIDES.contains(&nucleotide) {
        Err(nucleotide)
    } else {
        match dna.chars().find(|n| !NUCLEOTIDES.contains(n)) {
            Some(err) => Err(err),
            None => Ok(dna.chars().filter(|n| *n == nucleotide).count()),
        }
    }
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    match dna.chars().find(|n| !NUCLEOTIDES.contains(n)) {
        Some(err) => Err(err),
        None => Ok(NUCLEOTIDES.map(|n| (n, count(n, dna).unwrap())).into()),
    }
}
