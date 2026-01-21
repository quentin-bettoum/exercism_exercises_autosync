package clock

import "fmt"

type Clock struct {
	hours   int
	minutes int
}

func New(h, m int) Clock {
	clock := Clock{
		hours:   h,
		minutes: m,
	}
	clock.parseTime()

	return clock
}

func (c Clock) Add(m int) Clock {
	c.minutes += m
	c.parseTime()

	return c
}

func (c Clock) Subtract(m int) Clock {
	c.minutes -= m
	c.parseTime()

	return c
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hours, c.minutes)
}

func (c *Clock) parseTime() {
	for c.minutes < 0 {
		c.minutes += 60
		c.hours--
	}

	for c.hours < 0 {
		c.hours += 24
	}

	for c.minutes >= 60 {
		c.hours++
		c.minutes -= 60
	}

	c.hours = c.hours % 24
}
