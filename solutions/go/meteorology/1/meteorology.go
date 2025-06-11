package meteorology

import "fmt"

type TemperatureUnit int

const (
	Celsius    TemperatureUnit = 0
	Fahrenheit TemperatureUnit = 1
)

func (tempUnit TemperatureUnit) String() string {
	switch tempUnit {
	case Celsius:
		return "°C"
	case Fahrenheit:
		return "°F"
	}
	return ""
}

type Temperature struct {
	degree int
	unit   TemperatureUnit
}

func (temp Temperature) String() string {
	return fmt.Sprintf("%d %s", temp.degree, temp.unit.String())
}

type SpeedUnit int

const (
	KmPerHour    SpeedUnit = 0
	MilesPerHour SpeedUnit = 1
)

func (speedUnit SpeedUnit) String() string {
	switch speedUnit {
	case KmPerHour:
		return "km/h"
	case MilesPerHour:
		return "mph"
	}
	return ""
}

type Speed struct {
	magnitude int
	unit      SpeedUnit
}

func (speed Speed) String() string {
	return fmt.Sprintf("%d %s", speed.magnitude, speed.unit.String())
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
		"%s: %s, Wind %s at %s, %d%% Humidity",
		mData.location,
		mData.temperature.String(),
		mData.windDirection,
		mData.windSpeed.String(),
		mData.humidity)
}
