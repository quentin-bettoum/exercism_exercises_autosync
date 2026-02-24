module main

import datatypes { Set }

fn is_pangram(phrase string) bool {
	mut letters := Set[rune]{}

	letters.add_all(phrase.to_lower().runes().filter(it >= `a` && it <= `z`))

	return letters.size() == 26
}
