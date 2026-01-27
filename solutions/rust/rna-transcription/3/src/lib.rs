use std::{collections::HashMap, sync::LazyLock};

static NUCLEOTIDES: LazyLock<HashMap<char, char>> =
    LazyLock::new(|| HashMap::from([('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]));
static DNA_NUCLEOTIDES: LazyLock<Vec<char>> =
    LazyLock::new(|| NUCLEOTIDES.keys().copied().collect());
static RNA_NUCLEOTIDES: LazyLock<Vec<char>> =
    LazyLock::new(|| NUCLEOTIDES.values().copied().collect());

#[derive(Debug, PartialEq, Eq)]
pub struct Dna(String);

#[derive(Debug, PartialEq, Eq)]
pub struct Rna(String);

impl Dna {
    pub fn new(dna: &str) -> Result<Self, usize> {
        dna.chars()
            .position(|c| !DNA_NUCLEOTIDES.contains(&c))
            .map_or_else(|| Ok(Self(dna.to_owned())), Err)
    }

    pub fn into_rna(self) -> Rna {
        Rna(self.0.chars().map(|c| NUCLEOTIDES[&c]).collect())
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Self, usize> {
        rna.chars()
            .position(|c| !RNA_NUCLEOTIDES.contains(&c))
            .map_or_else(|| Ok(Self(rna.to_owned())), Err)
    }
}
