package reverse

func Reverse(input string) (output string) {
	runes := []rune(input)
	for i := len(runes) - 1; i >= 0; i-- {
		output += string(runes[i])
	}
	return
}
