package listops

// IntList is an abstraction of a list of integers which we can define methods on
type IntList []int

func (s IntList) Foldl(fn func(int, int) int, initial int) int {
	for i := 0; i < s.Length(); i++ {
		initial = fn(initial, s[i])
	}

	return initial
}

func (s IntList) Foldr(fn func(int, int) int, initial int) int {
	for i := s.Length() - 1; i >= 0; i-- {
		initial = fn(s[i], initial)
	}

	return initial
}

func (s IntList) Filter(fn func(int) bool) IntList {
	filtered := make(IntList, 0)

	for _, v := range s {
		if fn(v) {
			filtered = append(filtered, v)
		}
	}

	return filtered
}

func (s IntList) Length() (count int) {
	for range s {
		count++
	}

	return
}

func (s IntList) Map(fn func(int) int) IntList {
	mapped := make(IntList, s.Length())

	for i, v := range s {
		mapped[i] = fn(v)
	}

	return mapped
}

func (s IntList) Reverse() IntList {
	reversed := make(IntList, s.Length())
	len := s.Length()
	for i := len - 1; i >= 0; i-- {
		reversed[len-i-1] = s[i]
	}

	return reversed
}

func (s IntList) Append(lst IntList) IntList {
	len := s.Length()
	newList := make(IntList, len+lst.Length())

	copy(newList, s)

	for i, v := range lst {
		newList[len+i] = v
	}

	return newList
}

func (s IntList) Concat(lists []IntList) IntList {
	for _, l := range lists {
		s = s.Append(l)
	}

	return s
}
