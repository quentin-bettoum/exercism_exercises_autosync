package dndcharacter

import (
	"math"
	"math/rand"
	"slices"
)

type Character struct {
	Strength     int
	Dexterity    int
	Constitution int
	Intelligence int
	Wisdom       int
	Charisma     int
	Hitpoints    int
}

// Modifier calculates the ability modifier for a given ability score
func Modifier(score int) int {
	modifier := (float64(score) - 10.0) / 2.0
	modifier = math.Floor(modifier)
	return int(modifier)
}

// Ability uses randomness to generate the score for an ability
func Ability() int {
	var dices []int

	for i := 0; i < 4; i++ {
		dices = append(dices, rand.Intn(5)+1)
	}
	slices.Sort(dices)

	return dices[3] + dices[2] + dices[1]
}

// GenerateCharacter creates a new Character with random scores for abilities
func GenerateCharacter() Character {
	constitution := Ability()
	return Character{
		Strength:     Ability(),
		Dexterity:    Ability(),
		Constitution: constitution,
		Intelligence: Ability(),
		Wisdom:       Ability(),
		Charisma:     Ability(),
		Hitpoints:    10 + Modifier(constitution),
	}
}
