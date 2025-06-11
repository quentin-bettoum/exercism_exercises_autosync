package meteorology

import "fmt"

type TemperatureUnit int

const (
	Celsius    TemperatureUnit = 0
	Fahrenheit TemperatureUnit = 1
)

func (tempUnit TemperatureUnit) String() string {
	return [...]string{"°C", "°F"}[tempUnit]
}

type Temperature struct {
	degree int
	unit   TemperatureUnit
}

func (temp Temperature) String() string {
	return fmt.Sprintf("%v %v", temp.degree, temp.unit)
}

type SpeedUnit int

const (
	KmPerHour    SpeedUnit = 0
	MilesPerHour SpeedUnit = 1
)

func (speedUnit SpeedUnit) String() string {
	return [...]string{"km/h", "mph"}[speedUnit]
}

type Speed struct {
	magnitude int
	unit      SpeedUnit
}

func (speed Speed) String() string {
	return fmt.Sprintf("%v %v", speed.magnitude, speed.unit)
}

type MeteorologyData struct {
	location      string
	temperature   Temperature
	windDirection string
	windSpeed     Speed
	humidity      int
}

func (mData MeteorologyData) String() string {
	return fmt.Sprintf(
		"%v: %v, Wind %v at %v, %v%% Humidity",
		mData.location,
		mData.temperature,
		mData.windDirection,
		mData.windSpeed,
		mData.humidity)
}
