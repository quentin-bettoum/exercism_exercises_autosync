package strain

func Keep[T any](s []T, wanted func(T) bool) (filteredSlice []T) {
	for _, val := range s {
		if wanted(val) {
			filteredSlice = append(filteredSlice, val)
		}
	}
	return
}

func Discard[T any](s []T, notWanted func(T) bool) (filteredSlice []T) {
	for _, val := range s {
		if notWanted(val) {
			continue
		}
		filteredSlice = append(filteredSlice, val)
	}
	return
}
