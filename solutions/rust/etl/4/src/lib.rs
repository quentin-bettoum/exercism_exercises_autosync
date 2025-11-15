use std::collections::BTreeMap;

type OldScore = BTreeMap<i32, Vec<char>>;
type NewScore = BTreeMap<char, i32>;

pub fn transform(h: &OldScore) -> NewScore {
    let mut transformed: NewScore = Default::default();

    for (points, v) in h {
        for c in v {
            transformed.insert(c.to_ascii_lowercase(), *points);
        }
    }

    transformed
}
