module main

fn accumulate[T](values []T, operation fn (T) T) []T {
	mut result := []T{cap: values.len}

	for v in values {
		result << operation(v)
	}

	return result
}

fn accumulate_ints(values []int, operation fn (int) int) []int {
	return accumulate(values, operation)
}

fn accumulate_strs(values []string, operation fn (string) string) []string {
	return accumulate(values, operation)
}
