package brackets

var (
	brackets          = map[rune]rune{'[': ']', '{': '}', '(': ')'}
	reversed_brackets = make(map[rune]rune, len(brackets))
)

func init() {
	for k, v := range brackets {
		reversed_brackets[v] = k
	}
}

func Bracket(input string) bool {
	var stack []rune

	for _, r := range []rune(input) {
		if opening_bracket, ok := reversed_brackets[r]; ok {
			if len(stack) == 0 || stack[0] != opening_bracket {
				return false
			}
			stack = stack[1:]
		} else if _, ok := brackets[r]; ok {
			stack = append([]rune{r}, stack...)
		}
	}

	return len(stack) == 0
}
