package brackets

import "slices"

func Bracket(input string) bool {
	var stack []rune
	brackets := map[rune]rune{'[': ']', '{': '}', '(': ')'}
	reversed_brackets := make(map[rune]rune, len(brackets))
	opening_brackets := make([]rune, len(brackets))
	closing_brackets := opening_brackets

	for k, v := range brackets {
		reversed_brackets[v] = k
		opening_brackets = append(opening_brackets, k)
		closing_brackets = append(closing_brackets, v)
	}

	runes := []rune(input)

	for _, r := range runes {
		if slices.Contains(closing_brackets, r) {
			opening_bracket, ok := reversed_brackets[r]
			if ok && len(stack) > 0 && opening_bracket == stack[0] {
				stack = stack[1:]
			} else {
				return false
			}
		} else if slices.Contains(opening_brackets, r) {
			stack = append([]rune{r}, stack...)
		}
	}

	return len(stack) == 0
}
