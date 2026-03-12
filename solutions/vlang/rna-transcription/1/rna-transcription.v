module main

const numbers = {
	`A`: `U`
	`C`: `G`
	`G`: `C`
	`T`: `A`
}

fn to_rna(dna string) string {
	return dna.runes().map(numbers[it]).string()
}
