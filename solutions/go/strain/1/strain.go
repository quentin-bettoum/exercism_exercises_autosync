package strain

// Implement the "Keep" and "Discard" function in this file.
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

// You will need typed parameters (aka "Generics") to solve this exercise.
// They are not part of the Exercism syllabus yet but you can learn about
// them here: https://go.dev/tour/generics/1
