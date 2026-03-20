module main

enum Allergen as u8 {
	eggs         = 1
	peanuts      = 2
	shellfish    = 4
	strawberries = 8
	tomatoes     = 16
	chocolate    = 32
	pollen       = 64
	cats         = 128
}

fn allergic_to(allergen Allergen, score u8) bool {
	return u8(allergen) & score > 0
}

fn list(score u8) []Allergen {
	mut allergens := []Allergen{}
	$for a in Allergen.values {
		allergen := Allergen(a.value)
		if allergic_to(allergen, score) {
			allergens << allergen
		}
	}
	return allergens
}
