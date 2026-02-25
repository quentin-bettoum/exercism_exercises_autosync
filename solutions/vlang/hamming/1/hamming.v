module main

import arrays

fn distance(a string, b string) !int {
	if a.len != b.len {
		return error('lengths must match!')
	}

	return arrays.group[rune](a.runes(), b.runes()).count(it[0] != it[1])
}
