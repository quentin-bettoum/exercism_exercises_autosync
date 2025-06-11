package series

func All(n int, s string) (series []string) {
	stringLength := len(s)
	if n > stringLength {
		return
	}

	for i := 0; i+n <= stringLength; i++ {
		var serie string
		for x := 0; x < n; x++ {
			serie += string(s[i+x])
		}
		series = append(series, serie)
	}

	return
}

func UnsafeFirst(n int, s string) (serie string) {
	if n <= len(s) {
		for x := 0; x < n; x++ {
			serie += string(s[x])
		}
	}

	return
}

func First(n int, s string) (serie string, ok bool) {
	serie = UnsafeFirst(n, s)
	ok = serie != ""

	return
}
