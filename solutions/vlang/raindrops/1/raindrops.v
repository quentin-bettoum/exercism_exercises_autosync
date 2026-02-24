module main

fn raindrops(number int) string {
	mut str := ''

	if number % 3 == 0 {
		str += 'Pling'
	}
	if number % 5 == 0 {
		str += 'Plang'
	}
	if number % 7 == 0 {
		str += 'Plong'
	}

	return if str == '' { number.str() } else { str }
}
