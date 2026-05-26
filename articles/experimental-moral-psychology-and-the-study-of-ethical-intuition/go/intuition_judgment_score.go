// Synthetic moral judgment score example for Experimental Moral Psychology.
// Educational scaffold only.
//
// Run:
//   go run go/intuition_judgment_score.go

package main

import "fmt"

func main() {
	indicators := map[string]float64{
		"intuition":               0.8,
		"reflection":              0.4,
		"norm_sensitivity":        0.7,
		"consequence_sensitivity": 0.6,
	}

	weights := map[string]float64{
		"intuition":               0.30,
		"reflection":              0.20,
		"norm_sensitivity":        0.25,
		"consequence_sensitivity": 0.25,
	}

	score := 0.0
	for variable, value := range indicators {
		score += value * weights[variable]
	}

	fmt.Printf("Synthetic moral judgment score: %.3f\n", score)
}
