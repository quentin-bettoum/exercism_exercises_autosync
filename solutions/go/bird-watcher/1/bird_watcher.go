package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) int {
	c := 0
	for i := 0; i <= len(birdsPerDay)-1; i++ {
		c += birdsPerDay[i]
	}
	return c
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	c := 0
	startIndex := (week - 1) * 7
	maxIndex := (week * 7) - 1
	for i := startIndex; i <= maxIndex; i++ {
		c += birdsPerDay[i]
	}
	return c
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := 0; i <= len(birdsPerDay)-1; i++ {
		if i%2 == 0 {
			birdsPerDay[i] += 1
		}
	}
	return birdsPerDay
}
