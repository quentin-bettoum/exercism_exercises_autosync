package brackets

var (
	brackets         = map[rune]rune{'[': ']', '{': '}', '(': ')'}
	reversedBrackets = make(map[rune]rune, len(brackets))
)

func init() {
	for k, v := range brackets {
		reversedBrackets[v] = k
	}
}

func Bracket(input string) bool {
	var stack []rune

	for _, r := range input {
		if openingBracket, ok := reversedBrackets[r]; ok {
			if len(stack) == 0 || stack[0] != openingBracket {
				return false
			}
			stack = stack[1:]
		} else if _, ok := brackets[r]; ok {
			stack = append([]rune{r}, stack...)
		}
	}

	return len(stack) == 0
}
