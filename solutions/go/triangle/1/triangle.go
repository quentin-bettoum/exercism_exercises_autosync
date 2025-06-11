// Package triangle handles different kind of triangle.
package triangle

type Kind int

const (
	NaT = iota // not a triangle
	Equ        // equilateral
	Iso        // isosceles
	Sca        // scalene
)

// KindFromSides determines the kind of triangle from its sides lengths.
func KindFromSides(a, b, c float64) (k Kind) {
	switch {
	case a <= 0 || b <= 0 || c <= 0 || a+b <= c || a+c <= b || b+c <= a:
		return NaT
	case a == b && b == c:
		return Equ
	case a == b || b == c || a == c:
		return Iso
	default:
		return Sca
	}
}
