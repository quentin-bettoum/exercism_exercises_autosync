package lasagna

import "slices"

func PreparationTime(layers []string, preparationTimePerLayer int) int {
	if preparationTimePerLayer == 0 {
		preparationTimePerLayer = 2
	}
	return preparationTimePerLayer * len(layers)
}

func Quantities(layers []string) (gramsOfNoodles int, litersOfSauce float64) {
	for _, layer := range layers {
		switch layer {
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
