package rotationalcipher

import "unicode"

func RotationalCipher(plain string, shiftKey int) (encryptedStr string) {
	for _, v := range plain {
		if !unicode.IsLetter(v) {
			encryptedStr += string(v)
			continue
		}
		encryptedStr += string(rotChar(v, shiftKey))
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

	if charDecimalVal+shiftKey > maxDecimalVal {
		return rune(minDecimalVal + (shiftKey - (maxDecimalVal - charDecimalVal)) - 1)
	}
	return rune(charDecimalVal + shiftKey)
}
