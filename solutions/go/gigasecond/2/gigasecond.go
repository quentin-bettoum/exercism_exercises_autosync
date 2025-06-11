// Package gigasecond is about using gigaseconds to measure time.
package gigasecond

// import path for the time package from the standard library
import "time"

// AddGigasecond returns the date and time one gigasecond after a certain date.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
