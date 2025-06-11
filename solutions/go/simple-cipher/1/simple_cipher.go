package cipher

import (
	"unicode"
)

type shift struct {
	distance int
}
type vigenere struct {
	key string
}
type caesar struct{}

func NewCaesar() Cipher {
	return caesar{}
}

func (c caesar) Encode(input string) string {
	return cipher(input, 3)
}

func (c caesar) Decode(input string) string {
	return cipher(input, 23)
}

func NewShift(distance int) Cipher {
	if distance == 0 || distance < -25 || distance > 25 {
		return nil
	}
	return shift{distance: distance}
}

func (c shift) Encode(input string) string {
	return cipher(input, c.distance)
}

func (c shift) Decode(input string) string {
	return cipher(input, -c.distance)
}

func NewVigenere(key string) Cipher {
	var aCount int
	for _, r := range key {
		if !unicode.IsLower(r) {
			return nil
		}
		if r == 'a' {
			aCount++
		}
	}
	if aCount == len(key) {
		return nil
	}

	return vigenere{key}
}

func (v vigenere) Encode(input string) (output string) {
	var keyIndex int
	for _, r := range input {
		if keyIndex == len(v.key) {
			keyIndex = 0
		}
		key := unicode.ToLower(rune(v.key[keyIndex]))
		distance := key - 'a'
		output += shiftKey(r, int(distance))
		keyIndex++
	}

	return
}

func (v vigenere) Decode(input string) (output string) {
	var keyIndex int
	for _, r := range input {
		if keyIndex == len(v.key) {
			keyIndex = 0
		}
		key := unicode.ToLower(rune(v.key[keyIndex]))
		distance := key - 'a'
		output += shiftKey(r, -int(distance))
		keyIndex++
	}

	return
}

func cipher(input string, distance int) (output string) {
	distance = normalizeDistance(distance)
	for _, r := range input {
		output += string(shiftKey(r, distance))
	}
	return
}

func shiftKey(letter rune, distance int) string {
	if !unicode.IsLetter(letter) {
		return ""
	}

	letter = unicode.ToLower(letter)
	distance = normalizeDistance(distance)
	return string(((letter - 'a' + rune(distance)) % 26) + 'a')
}

func normalizeDistance(distance int) int {
	for distance < 'a' {
		distance += 26
	}

	return distance % 26
}
