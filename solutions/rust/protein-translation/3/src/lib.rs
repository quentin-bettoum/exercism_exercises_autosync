use regex_lite::Regex;

pub type Codon = str;
pub type AminoAcid = &'static str;
pub type Protein = Vec<AminoAcid>;
pub type TranslationError = &'static str;

pub fn translate(rna: &str) -> Option<Protein> {
    let mut protein: Protein = Vec::new();
    for c in Regex::new(r".{1,3}").unwrap().find_iter(rna) {
        match from_codon(c.as_str()) {
            Ok("STOP") => return Some(protein),
            Ok(amino_acid) => protein.push(amino_acid),
            Err(_) => return None,
        }
    }
    Some(protein)
}

fn from_codon(codon: &Codon) -> Result<AminoAcid, TranslationError> {
    match codon {
        "AUG" => Ok("Methionine"),
        "UUU" | "UUC" => Ok("Phenylalanine"),
        "UUA" | "UUG" => Ok("Leucine"),
        "UCU" | "UCC" | "UCA" | "UCG" => Ok("Serine"),
        "UAU" | "UAC" => Ok("Tyrosine"),
        "UGU" | "UGC" => Ok("Cysteine"),
        "UGG" => Ok("Tryptophan"),
        "UAA" | "UAG" | "UGA" => Ok("STOP"),
        _ => Err("invalid base"),
    }
}
