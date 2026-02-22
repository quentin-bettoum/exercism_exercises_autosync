package robotname

import (
	"errors"
	"fmt"
	"math/rand"
	"time"
)

const MAXNAMES = 26 * 26 * 10 * 10 * 10

var (
	ErrNamespaceExhausted = errors.New("there is no name left available")
	usedNames             = map[string]bool{}
	rng                   = rand.New(rand.NewSource(time.Now().UnixNano()))
)

type Robot struct {
	name string
}

func (r *Robot) Name() (string, error) {
	if len(r.name) == 0 {
		name, err := randomName()
		if err != nil {
			return "", err
		}

		r.name = name
	}

	return r.name, nil
}

func (r *Robot) Reset() (err error) {
	name, err := randomName()

	if err == nil {
		r.name = name
	}

	return
}

func randomName() (string, error) {
	if len(usedNames) >= MAXNAMES {
		return "", ErrNamespaceExhausted
	}

	for {
		letters := make([]byte, 2)
		for i := range letters {
			letters[i] = byte(rng.Intn(26) + 'A')
		}

		name := fmt.Sprintf("%s%03d", string(letters), rng.Intn(1000))

		if !usedNames[name] {
			usedNames[name] = true
			return name, nil
		}
	}
}
