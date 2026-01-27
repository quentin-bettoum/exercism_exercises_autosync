use std::{cell::RefCell, collections::HashSet, rc::Rc};

use rand::{
    Rng,
    distr::{Alphabetic, SampleString as _},
};

type NameSet = Rc<RefCell<HashSet<String>>>;

/// A `RobotFactory` is responsible for ensuring that all robots produced by
/// it have a unique name. Robots from different factories can have the same
/// name.
pub struct RobotFactory {
    used_names: NameSet,
}

pub struct Robot {
    name: String,
    used_names: NameSet,
}

impl RobotFactory {
    pub fn new() -> Self {
        Self {
            used_names: Rc::new(RefCell::new(HashSet::new())),
        }
    }

    pub fn new_robot<R: Rng>(&mut self, rng: &mut R) -> Robot {
        Robot {
            name: Self::generate_new_name(&self.used_names, rng),
            // NOTE: On why to prefer `Rc::clone(&foo)` over `foo.clone()` in this case
            // https://doc.rust-lang.org/book/ch15-04-rc.html#listing-15-18:~:text=argument%2E-,We,clone%2E
            used_names: Rc::clone(&self.used_names),
        }
    }

    fn generate_new_name<R: Rng>(used_names: &Rc<RefCell<HashSet<String>>>, rng: &mut R) -> String {
        loop {
            let number = rng.random_range(100..=999).to_string();
            let str = Alphabetic.sample_string(rng, 2).to_uppercase();
            let name = format!("{str}{number}");

            if used_names.borrow_mut().insert(name.clone()) {
                return name;
            }
        }
    }
}

impl Robot {
    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn reset<R: Rng>(&mut self, rng: &mut R) {
        self.used_names.borrow_mut().remove(&self.name);
        self.name = RobotFactory::generate_new_name(&self.used_names, rng);
    }
}
