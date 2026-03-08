module main

import regex
import strings

fn abbreviate(phrase string) string {
	mut acronym := strings.new_builder(phrase.len)
	mut re := regex.regex_opt(r"[a-zA-Z']+") or { panic(err) }

	for word in re.find_all_str(phrase) {
		acronym.write_u8(word[0])
	}

	return acronym.str().to_upper()
}
