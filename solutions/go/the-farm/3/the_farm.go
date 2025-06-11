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
		return 0, ErrInvalidNumberOfCows
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
