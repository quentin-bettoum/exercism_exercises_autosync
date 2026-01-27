use rayon::prelude::*;
use rayon::ThreadPoolBuilder;
use std::collections::HashMap;

type Frequency = HashMap<char, usize>;

pub fn frequency(input: &[&str], worker_count: usize) -> Frequency {
    if input.is_empty() {
        return HashMap::new();
    }

    let pool = ThreadPoolBuilder::new()
        .num_threads(worker_count)
        .build()
        .unwrap();

    pool.install(|| {
        input
            .par_iter()
            .fold(HashMap::new, |mut acc, text| {
                count_chars(text, &mut acc);
                acc
            })
            .reduce(HashMap::new, |mut a, b| {
                for (k, v) in b {
                    *a.entry(k).or_insert(0) += v;
                }
                a
            })
    })
}

fn count_chars(text: &str, acc: &mut HashMap<char, usize>) {
    text.to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .for_each(|c| *acc.entry(c).or_insert(0) += 1);
}
