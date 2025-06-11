// Package gigasecond is about using gigaseconds to measure time.
package gigasecond

// import path for the time package from the standard library
import "time"

// AddGigasecond returns the date and time one gigasecond after a certain date.
func AddGigasecond(t time.Time) time.Time {
	oneGigaSecond, _ := time.ParseDuration("1000000000s")
	return t.Add(oneGigaSecond)
}
