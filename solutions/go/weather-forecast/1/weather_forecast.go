// Package weather provides tools around weather forecast.
package weather

// CurrentCondition contains the current weather condition.
var CurrentCondition string

// CurrentLocation contains the current location.
var CurrentLocation string

// Forecast returns a string with the current location and the current weather condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
