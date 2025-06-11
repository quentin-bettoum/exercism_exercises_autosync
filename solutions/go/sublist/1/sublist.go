package sublist

import "slices"

func Sublist(l1, l2 []int) Relation {
	len1 := len(l1)
	len2 := len(l2)

	switch {
	case len1 < len2:
		for i := 0; i+len1 <= len2; i++ {
			if slices.Equal(l1, l2[i:i+len1]) {
				return RelationSublist
			}
		}

	case len1 > len2:
		for i := 0; i+len2 <= len1; i++ {
			if slices.Equal(l2, l1[i:i+len2]) {
				return RelationSuperlist
			}
		}

	case slices.Equal(l1, l2):
		return RelationEqual
	}

	return RelationUnequal
}
