package rotationalcipher

func RotationalCipher(plain string, shiftKey int) (encryptedStr string) {
	for _, r := range plain {
		encryptedStr += string(rotChar(r, shiftKey))
	}

	return
}

func rotChar(char rune, shiftKey int) rune {
	charDecimalVal := int(char)
	minDecimalVal := 97
	maxDecimalVal := 122

	if charDecimalVal < 90 {
		minDecimalVal = 65
		maxDecimalVal = 90
	}

	if charDecimalVal < minDecimalVal || charDecimalVal > maxDecimalVal {
		return char
	}

	if charDecimalVal+shiftKey > maxDecimalVal {
		return rune(minDecimalVal + (shiftKey - (maxDecimalVal - charDecimalVal)) - 1)
	}
	return rune(charDecimalVal + shiftKey)
}
