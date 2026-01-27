use rand::{
    distr::{Alphabetic, SampleString as _},
    rng,
};

pub fn encode(key: &str, s: &str) -> Option<String> {
    key_is_valid(key).then(|| transform(key, s, |c, k| (c + k) % 26))
}

pub fn decode(key: &str, s: &str) -> Option<String> {
    key_is_valid(key).then(|| transform(key, s, |c, k| (26 + c - k) % 26))
}

fn transform(key: &str, s: &str, transform_fn: fn(u8, u8) -> u8) -> String {
    let padded_key: String = key.chars().cycle().take(s.len()).collect();

    s.chars()
        .zip(padded_key.chars())
        .map(|(c, k)| {
            let c_pos = c as u8 - b'a';
            let k_pos = k as u8 - b'a';
            let result_pos = transform_fn(c_pos, k_pos);
            (result_pos + b'a') as char
        })
        .collect()
}

pub fn encode_random(s: &str) -> (String, String) {
    let mut rng = rng();
    let key_length = s.len().max(100);
    let key = &Alphabetic
        .sample_string(&mut rng, key_length)
        .to_lowercase();

    (key.to_string(), encode(key, s).unwrap())
}

fn key_is_valid(key: &str) -> bool {
    !key.is_empty() && key.chars().all(|c| c.is_ascii_lowercase())
}
