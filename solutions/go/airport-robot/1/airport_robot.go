package airportrobot

import "fmt"

type Greeter interface {
	LanguageName() string
	Greet(visitorName string) string
}

var greetStr string = "I can speak %s: %s %s!"

func SayHello(visitorName string, greeter Greeter) string {
	return greeter.Greet(visitorName)
}

type Italian struct {
	GreetStr string
}

func (i Italian) LanguageName() string {
	return "Italian"
}

func (i Italian) Greet(visitorName string) string {
	return fmt.Sprintf(greetStr, i.LanguageName(), "Ciao", visitorName)
}

type Portuguese struct {
	GreetStr string
}

func (i Portuguese) LanguageName() string {
	return "Portuguese"
}

func (i Portuguese) Greet(visitorName string) string {
	return fmt.Sprintf(greetStr, i.LanguageName(), "Olá", visitorName)
}
