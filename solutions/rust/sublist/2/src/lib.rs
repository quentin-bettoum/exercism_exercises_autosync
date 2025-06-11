#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist(a: &[i32], b: &[i32]) -> Comparison {
    if a == b {
        Comparison::Equal
    } else if a.is_empty() || b.windows(a.len()).any(|w| w == a) {
        Comparison::Sublist
    } else if b.is_empty() || a.windows(b.len()).any(|w| w == b) {
        Comparison::Superlist
    } else {
        Comparison::Unequal
    }
}
