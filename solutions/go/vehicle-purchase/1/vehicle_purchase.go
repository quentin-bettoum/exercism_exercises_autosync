package purchase

import "slices"

// NeedsLicense determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
func NeedsLicense(kind string) bool {
	vehicles := []string{"car", "truck"}
	return slices.Contains(vehicles, kind)
}

// ChooseVehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
func ChooseVehicle(option1, option2 string) string {
	var vehicle string
	if option1 < option2 {
		vehicle = option1
	} else {
		vehicle = option2
	}
	return vehicle + " is clearly the better choice."
}

// CalculateResellPrice calculates how much a vehicle can resell for at a certain age.
func CalculateResellPrice(originalPrice, age float64) float64 {
	var percentage float64 = 70
	if age < 3 {
		percentage = 80
	} else if age >= 10 {
		percentage = 50
	}

	return calculatePercentage(originalPrice, percentage)
}

func calculatePercentage(number, percentage float64) float64 {
	return number / 100 * percentage
}
