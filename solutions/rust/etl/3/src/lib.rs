use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    let mut transformed: BTreeMap<char, i32> = Default::default();

    for (points, v) in h {
        for c in v {
            transformed.insert(c.to_ascii_lowercase(), *points);
        }
    }

    transformed
}
