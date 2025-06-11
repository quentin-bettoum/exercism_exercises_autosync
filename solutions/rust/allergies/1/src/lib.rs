pub struct Allergies {
    allergens: Vec<Allergen>,
}

#[derive(Debug, PartialEq, Eq, Copy, Clone)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
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
        let mut allergens: Vec<Allergen> = vec![];

        while score != 0 {
            if score > 256 {
                score -= 256
            } else if score >= Allergen::Cats as u32 {
                allergens.push(Allergen::Cats);
                score -= Allergen::Cats as u32;
            } else if score >= Allergen::Pollen as u32 {
                allergens.push(Allergen::Pollen);
                score -= Allergen::Pollen as u32;
            } else if score >= Allergen::Chocolate as u32 {
                allergens.push(Allergen::Chocolate);
                score -= Allergen::Chocolate as u32;
            } else if score >= Allergen::Tomatoes as u32 {
                allergens.push(Allergen::Tomatoes);
                score -= Allergen::Tomatoes as u32;
            } else if score >= Allergen::Strawberries as u32 {
                allergens.push(Allergen::Strawberries);
                score -= Allergen::Strawberries as u32;
            } else if score >= Allergen::Shellfish as u32 {
                allergens.push(Allergen::Shellfish);
                score -= Allergen::Shellfish as u32;
            } else if score >= Allergen::Peanuts as u32 {
                allergens.push(Allergen::Peanuts);
                score -= Allergen::Peanuts as u32;
            } else if score == Allergen::Eggs as u32 {
                allergens.push(Allergen::Eggs);
                score -= Allergen::Eggs as u32;
            }
        }

        allergens.reverse();
        allergens
    }
}
