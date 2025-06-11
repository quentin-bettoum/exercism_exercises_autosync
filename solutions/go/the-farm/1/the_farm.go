package thefarm

import (
	"errors"
	"fmt"
)

func DivideFood(calc FodderCalculator, numberOfCows int) (result float64, err error) {
	fodderAmount, err := calc.FodderAmount(numberOfCows)
	if err != nil {
		return result, err
	}

	fatteningFactor, err := calc.FatteningFactor()
	if err != nil {
		return result, err
	}

	result = (fodderAmount / float64(numberOfCows)) * fatteningFactor
	return result, err
}

var ErrInvalidNumberOfCows = errors.New("invalid number of cows")

func ValidateInputAndDivideFood(calc FodderCalculator, numberOfCows int) (float64, error) {
	if numberOfCows <= 0 {
		return 0.0, ErrInvalidNumberOfCows
	}
	return DivideFood(calc, numberOfCows)
}

type InvalidCowsError struct {
	numberOfCows int
	message      string
}

func (e *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", e.numberOfCows, e.message)
}

func ValidateNumberOfCows(numberOfCows int) (err error) {
	if numberOfCows < 0 {
		err = &InvalidCowsError{numberOfCows, "there are no negative cows"}
	} else if numberOfCows == 0 {
		err = &InvalidCowsError{numberOfCows, "no cows don't need food"}
	}
	return err
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
