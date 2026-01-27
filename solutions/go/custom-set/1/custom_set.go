package stringset

import "strings"

type Set map[string]bool

func New() Set {
	return make(Set)
}

func NewFromSlice(l []string) Set {
	set := New()

	for _, item := range l {
		set[item] = true
	}

	return set
}

func (s Set) String() string {
	if len(s) == 0 {
		return "{}"
	}

	var wrappedItems []string

	for item := range s {
		wrappedItems = append(wrappedItems, `"`+item+`"`)
	}

	return "{" + strings.Join(wrappedItems, ", ") + "}"
}

func (s Set) IsEmpty() bool {
	return len(s) == 0
}

func (s Set) Has(elem string) bool {
	return s[elem]
}

func (s Set) Add(elem string) {
	s[elem] = true
}

func Subset(s1, s2 Set) bool {
	for item := range s1 {
		if !s2.Has(item) {
			return false
		}
	}

	return true
}

func Disjoint(s1, s2 Set) bool {
	for item := range s1 {
		if s2.Has(item) {
			return false
		}
	}

	return true
}

func Equal(s1, s2 Set) bool {
	return len(s1) == len(s2) && Subset(s1, s2)
}

func Intersection(s1, s2 Set) Set {
	set := New()

	for item := range s1 {
		if s2.Has(item) {
			set.Add(item)
		}
	}

	return set
}

func Difference(s1, s2 Set) Set {
	set := New()

	for item := range s1 {
		if !s2.Has(item) {
			set.Add(item)
		}
	}

	return set
}

func Union(s1, s2 Set) Set {
	set := New()

	for item := range s1 {
		set.Add(item)
	}

	for item := range s2 {
		set.Add(item)
	}

	return set
}
