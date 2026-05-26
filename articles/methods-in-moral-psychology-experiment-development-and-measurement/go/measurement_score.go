// Synthetic measurement score example for Methods in Moral Psychology.
// Educational scaffold only.
//
// Run:
//   go run go/measurement_score.go

package main

import "fmt"

func main() {
	indicators := map[string]float64{
		"wrongness":       0.8,
		"blame":           0.6,
		"norm_learning":   0.7,
		"action_tendency": 0.5,
	}

	weights := map[string]float64{
		"wrongness":       0.35,
		"blame":           0.30,
		"norm_learning":   0.20,
		"action_tendency": 0.15,
	}

	score := 0.0
	for variable, value := range indicators {
		score += value * weights[variable]
	}

	fmt.Printf("Synthetic latent moral construct score: %.3f\n", score)
}
