use std::collections::HashSet;
use std::sync::{LazyLock, Mutex};

use rand::distr::{Alphabetic, SampleString};
use rand::{Rng, rng};

pub struct Robot {
    name: String,
}

static EXISTING_NAMES: LazyLock<Mutex<HashSet<String>>> =
    LazyLock::new(|| Mutex::new(HashSet::new()));

impl Robot {
    pub fn new() -> Self {
        let mut r = Robot {
            name: String::from(""),
        };
        r.reset_name();
        r
    }

    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn reset_name(&mut self) {
        let number = rng().random_range(100..=999).to_string();
        let str = Alphabetic.sample_string(&mut rng(), 2).to_uppercase();
        self.name = format!("{str}{number}").to_string();
        if !EXISTING_NAMES.lock().unwrap().insert(self.name.clone()) {
            self.reset_name();
        }
    }
}
