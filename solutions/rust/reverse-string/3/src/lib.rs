use unicode_segmentation::UnicodeSegmentation as _;

pub fn reverse(input: &str) -> String {
    input.graphemes(true).rev().collect()
}
