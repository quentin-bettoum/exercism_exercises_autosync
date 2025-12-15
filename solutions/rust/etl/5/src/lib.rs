use std::collections::BTreeMap;

type OldScore = BTreeMap<i32, Vec<char>>;
type NewScore = BTreeMap<char, i32>;

pub fn transform(h: &OldScore) -> NewScore {
    let mut transformed: NewScore = Default::default();

    for (points, letters) in h {
        for l in letters {
            transformed.insert(l.to_ascii_lowercase(), *points);
        }
    }

    transformed
}

// NOTE: In a more functional way, we eliminate mutable state
pub fn transform2(h: &OldScore) -> NewScore {
    h.iter()
        .flat_map(|(points, letters)| letters.iter().map(|l| (l.to_ascii_lowercase(), *points)))
        .collect()
}
