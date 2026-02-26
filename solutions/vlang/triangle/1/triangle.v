module main

fn is_triangle(a f64, b f64, c f64) bool {
	return a + b > c && b + c > a && c + a > b
}

fn is_isosceles(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && (a == b || b == c || c == a)
}

fn is_equilateral(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && a == b && b == c
}

fn is_scalene(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && !is_isosceles(a, b, c)
}
