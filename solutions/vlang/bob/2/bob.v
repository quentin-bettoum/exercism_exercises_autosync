module main

fn response(hey_bob string) string {
	remark := hey_bob.trim_space()
	if remark.len == 0 {
		return 'Fine. Be that way!'
	}

	has_uppercase_letters := remark.runes().any(it >= `A` && it <= `Z`)
	has_downcase_letters := remark.runes().any(it >= `a` && it <= `z`)
	is_yelled := has_uppercase_letters && !has_downcase_letters
	is_question := remark.ends_with('?')

	return match [is_question, is_yelled] {
		[true, true] {
			"Calm down, I know what I'm doing!"
		}
		[true, false] {
			'Sure.'
		}
		[false, true] {
			'Whoa, chill out!'
		}
		else {
			'Whatever.'
		}
	}
}
