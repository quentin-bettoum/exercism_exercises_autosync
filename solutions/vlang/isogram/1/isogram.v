module main

import datatypes
import encoding.utf8

fn is_isogram(word string) bool {
	mut letters := datatypes.Set[rune]{}

	for r in word.to_lower().runes().filter(utf8.is_letter(it)) {
		if letters.exists(r) {
			return false
		}
		letters.add(r)
	}

	return true
}

// fn is_isogram(word string) bool {
// 	mut letters := datatypes.Set[rune]{}

// 	return word
// 		.to_lower()
// 		.runes()
// 		.filter(utf8.is_letter(it))
// 		.all(fn [mut letters] (r rune) bool {
// 			if !letters.exists(r) {
// 				letters.add(r)
// 				return true
// 			}
// 			return false
// 		})
// }
