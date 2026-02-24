module main

import datatypes

fn is_pangram(phrase string) bool {
	mut letters := datatypes.Set[rune]{}

	letters.add_all(phrase.to_lower().runes().filter(it >= `a` && it <= `z`))

	return letters.size() == 26
}
