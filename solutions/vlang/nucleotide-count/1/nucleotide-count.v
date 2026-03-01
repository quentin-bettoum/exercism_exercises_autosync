module main

fn count_nucleotides(strand string) !map[string]int {
	mut nucleotides_count := {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}

	nucleotides := nucleotides_count.keys()

	for n in strand.split('') {
		if !nucleotides.contains(n) {
			return error('${n} is not a valid nucleotide!')
		}
		nucleotides_count[n]++
	}

	return nucleotides_count
}
