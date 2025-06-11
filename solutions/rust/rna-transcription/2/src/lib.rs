use std::{collections::HashMap, sync::LazyLock};

static NUCLEOTIDES: LazyLock<HashMap<char, char>> =
    LazyLock::new(|| HashMap::from([('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]));
static DNA_NUCLEOTIDES: LazyLock<Vec<char>> =
    LazyLock::new(|| NUCLEOTIDES.keys().cloned().collect());
static RNA_NUCLEOTIDES: LazyLock<Vec<char>> =
    LazyLock::new(|| NUCLEOTIDES.values().cloned().collect());

#[derive(Debug, PartialEq, Eq)]
pub struct Dna(String);

#[derive(Debug, PartialEq, Eq)]
pub struct Rna(String);

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        match dna.chars().position(|c| !DNA_NUCLEOTIDES.contains(&c)) {
            Some(x) => Err(x),
            None => Ok(Dna(dna.to_string())),
        }
    }

    pub fn into_rna(self) -> Rna {
        Rna(self.0.chars().map(|c| NUCLEOTIDES[&c]).collect())
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        match rna.chars().position(|c| !RNA_NUCLEOTIDES.contains(&c)) {
            Some(x) => Err(x),
            None => Ok(Rna(rna.to_string())),
        }
    }
}
