module main

fn two_fer(s string) string {
	name := if s.is_blank() { 'you' } else { s }

	return 'One for ${name}, one for me.'
}
