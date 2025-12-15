#[derive(Debug)]
pub struct CustomSet<T> {
    items: Vec<T>,
}

impl<T: Clone + PartialEq> CustomSet<T> {
    pub fn new(input: &[T]) -> Self {
        let items = input.iter().fold(Vec::new(), |mut acc, item| {
            if !acc.contains(item) {
                acc.push(item.clone());
            }
            acc
        });

        Self { items }
    }

    pub fn contains(&self, element: &T) -> bool {
        self.items.iter().any(|el| el == element) // self.items.contains(element)
    }

    pub fn add(&mut self, element: T) {
        if !self.contains(&element) {
            self.items.push(element);
        }
    }

    pub fn is_subset(&self, other: &Self) -> bool {
        self.items.iter().all(|el| other.contains(el))
    }

    pub fn is_empty(&self) -> bool {
        self.items.is_empty()
    }

    pub fn is_disjoint(&self, other: &Self) -> bool {
        !self.items.iter().any(|el| other.contains(el))
    }

    pub fn intersection(&self, other: &Self) -> Self {
        let filtered: Vec<T> = self
            .items
            .iter()
            .filter(|&el| other.contains(el))
            .cloned()
            .collect();

        Self::new(&filtered)
    }

    pub fn difference(&self, other: &Self) -> Self {
        let filtered: Vec<T> = self
            .items
            .iter()
            .filter(|&el| !other.contains(el))
            .cloned()
            .collect();

        Self::new(&filtered)
    }

    pub fn union(&self, other: &Self) -> Self {
        let mut items = self.items.clone();
        items.extend(other.items.iter().filter(|&el| !self.contains(el)).cloned());

        Self::new(&items)
    }
}

impl<T: PartialEq> PartialEq for CustomSet<T> {
    fn eq(&self, other: &Self) -> bool {
        self.items.len() == other.items.len()
            && self.items.iter().all(|el| other.items.contains(el))
    }
}
