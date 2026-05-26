// Synthetic relevance score example for "Why Moral Psychology Matters Today".
// Educational scaffold only.
//
// Run:
//   go run go/relevance_score.go

package main

import "fmt"

func main() {
	values := map[string]float64{
		"political_polarization":       1.2,
		"organizational_risk":          0.8,
		"developmental_moral_learning": 0.4,
		"cross_cultural_variation":     0.5,
		"technology_amplification":     1.0,
		"moral_injury_burden":          0.9,
	}

	weights := map[string]float64{
		"political_polarization":       0.25,
		"organizational_risk":          0.20,
		"developmental_moral_learning": 0.15,
		"cross_cultural_variation":     0.15,
		"technology_amplification":     0.15,
		"moral_injury_burden":          0.20,
	}

	score := 0.0
	for variable, value := range values {
		score += value * weights[variable]
	}

	fmt.Printf("Synthetic moral psychology relevance score: %.3f\n", score)
}
