use strum::IntoEnumIterator;
use strum_macros::EnumIter;

pub struct Allergies {
    allergens: Vec<Allergen>,
}

#[derive(EnumIter, Debug, PartialEq, Eq, Copy, Clone)]
pub enum Allergen {
    Cats = 128,
    Pollen = 64,
    Chocolate = 32,
    Tomatoes = 16,
    Strawberries = 8,
    Shellfish = 4,
    Peanuts = 2,
    Eggs = 1,
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Self {
            allergens: Self::compute_allergens_from_score(score),
        }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.allergens.contains(allergen)
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        self.allergens.clone()
    }

    fn compute_allergens_from_score(mut score: u32) -> Vec<Allergen> {
        let mut allergens = Vec::<Allergen>::new();

        while score > 256 {
            score -= 256;
        }

        Allergen::iter().for_each(|a| {
            if score >= a as u32 {
                allergens.push(a);
                score -= a as u32;
            }
        });

        allergens.reverse();
        allergens
    }
}
