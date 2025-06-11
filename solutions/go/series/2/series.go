package series

func All(n int, s string) (series []string) {
	for i := 0; i+n <= len(s); i++ {
		series = append(series, s[i:i+n])
	}

	return
}

func UnsafeFirst(n int, s string) string {
	return s[:n]
}

func First(n int, s string) (serie string, ok bool) {
	if n <= len(s) {
		serie = UnsafeFirst(n, s)
		ok = serie != ""
	}

	return
}
