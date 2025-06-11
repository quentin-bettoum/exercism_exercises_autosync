package lasagna

import "slices"

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, preparationTimePerLayer int) int {
	if preparationTimePerLayer == 0 {
		preparationTimePerLayer = 2
	}
	return preparationTimePerLayer * len(layers)
}

func Quantities(layers []string) (int, float64) {
	var gramsOfNoodles int
	var litersOfSauce float64

	// for i := 0; i < len(layers); i++ {
	for _, ingredient := range layers {
		switch ingredient {
		case "noodles":
			gramsOfNoodles += 50
		case "sauce":
			litersOfSauce += 0.2
		}
	}

	return gramsOfNoodles, litersOfSauce
}

func AddSecretIngredient(friendIngredients []string, ownIngredients []string) {
	ownIngredients[len(ownIngredients)-1] = friendIngredients[len(friendIngredients)-1]
}

func ScaleRecipe(quantitiesForTwoPortions []float64, numberOfPortionsWanted int) []float64 {
	quantities := slices.Clone(quantitiesForTwoPortions)

	for i := 0; i < len(quantities); i++ {
		quantities[i] *= float64(numberOfPortionsWanted) / 2
	}

	return quantities
}
