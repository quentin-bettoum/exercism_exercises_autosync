module main

fn raindrops(number int) string {
	mut drops := ''

	if number % 3 == 0 {
		drops += 'Pling'
	}
	if number % 5 == 0 {
		drops += 'Plang'
	}
	if number % 7 == 0 {
		drops += 'Plong'
	}

	return if drops == '' { number.str() } else { drops }
}
