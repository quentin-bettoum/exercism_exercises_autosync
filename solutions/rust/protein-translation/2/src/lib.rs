use regex_lite::Regex;

pub fn translate(rna: &str) -> Option<Vec<&str>> {
    let mut sequence: Vec<&str> = Vec::new();
    for c in Regex::new(r".{1,3}").unwrap().find_iter(rna) {
        match from_codon(c.into()) {
            Ok("STOP") => return Some(sequence),
            Ok(name) => sequence.push(name),
            Err(_) => return None,
        }
    }
    Some(sequence)
}

fn from_codon(codon: &str) -> Result<&str, &str> {
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
