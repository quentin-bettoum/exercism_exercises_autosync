package binarysearch

func SearchInts(list []int, key int) int {
	low := 0
	high := len(list)

	for low < high {
		mid := (low + high) / 2
		value := list[mid]

		if value == key {
			return mid
		}

		if value < key {
			low = mid + 1
		} else {
			high = mid
		}
	}

	return -1
}
