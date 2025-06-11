package phonenumber

import (
	"errors"
	"fmt"
	"regexp"
	"strings"
)

var ErrInvalidNumber = errors.New("invalid phone number")

func Number(phoneNumber string) (number string, err error) {
	number, _, _, _ = ParseNumber(phoneNumber)

	if number == "" {
		err = ErrInvalidNumber
	}

	return
}

func AreaCode(phoneNumber string) (areaCode string, err error) {
	var number string
	number, areaCode, _, _ = ParseNumber(phoneNumber)

	if number == "" {
		err = ErrInvalidNumber
	}

	return
}

func Format(phoneNumber string) (formattedNumber string, err error) {
	number, areaCode, exchangeCode, subscriberNumber := ParseNumber(phoneNumber)

	if number == "" {
		err = ErrInvalidNumber
	} else {
		formattedNumber = fmt.Sprintf("(%s) %s-%s", areaCode, exchangeCode, subscriberNumber)
	}

	return
}

func ParseNumber(phoneNumber string) (validNumber, areaCode, exchangeCode, subscriberNumber string) {
	digitsRegexp := regexp.MustCompile("[0-9]+")
	digits := digitsRegexp.FindAllString(phoneNumber, -1)
	number := strings.Join(digits, "")

	if len(number) == 11 && number[0] == '1' {
		number = number[1:]
	}

	if len(number) == 10 {
		areaCode = number[0:3]
		exchangeCode = number[3:6]
		subscriberNumber = number[6:]

		if areaCode[:1] != "0" &&
			areaCode[:1] != "1" &&
			exchangeCode[:1] != "0" &&
			exchangeCode[:1] != "1" {
			validNumber = number
		}
	}

	return
}
