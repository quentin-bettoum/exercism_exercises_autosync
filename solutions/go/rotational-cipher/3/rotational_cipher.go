package rotationalcipher

func RotationalCipher(input string, rot int) (output string) {
	for _, r := range input {
		var base rune
		switch {
		case r >= 'A' && r <= 'Z':
			base = 'A'
		case r >= 'a' && r <= 'z':
			base = 'a'
		default:
			output += string(r)
			continue
		}
		output += string(((r - base + rune(rot)) % 26) + base)
	}
	return output
}
