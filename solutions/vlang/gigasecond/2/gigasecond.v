module main

import time

const gigasecond = int(1e9)

fn add_gigasecond(t time.Time) time.Time {
	return t.add_seconds(gigasecond)
}
