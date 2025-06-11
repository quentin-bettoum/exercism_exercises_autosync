#[derive(Debug)]
pub struct HighScores<'a>(&'a [u32]);

impl<'a> HighScores<'a> {
    pub fn new(scores: &'a [u32]) -> Self {
        HighScores(scores)
    }

    pub fn scores(&self) -> &[u32] {
        self.0
    }

    pub fn latest(&self) -> Option<u32> {
        self.0.last().copied()
    }

    pub fn personal_best(&self) -> Option<u32> {
        let mut scores = Vec::from(self.0);
        scores.sort();
        scores.last().copied()
    }

    pub fn personal_top_three(&self) -> Vec<u32> {
        let mut scores: Vec<u32> = Vec::from(self.0);
        scores.sort_by(|a, b| b.cmp(a));
        scores.iter().take(3).copied().collect()
    }
}
