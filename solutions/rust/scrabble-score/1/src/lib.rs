/// Compute the Scrabble score for a word.
pub fn score(word: &str) -> u64 {
    word.to_lowercase().chars().map(char_score).sum()
}

fn char_score(char: char) -> u64 {
    if "aeioulnrst".contains(char) {
        1
    } else if "dg".contains(char) {
        2
    } else if "bcmp".contains(char) {
        3
    } else if "fhvwy".contains(char) {
        4
    } else if char == 'k' {
        5
    } else if "jx".contains(char) {
        8
    } else if "qz".contains(char) {
        10
    } else {
        0
    }
}
