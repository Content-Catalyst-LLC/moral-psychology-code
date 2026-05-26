// Synthetic culturally weighted moral judgment example.
// Educational scaffold only.
//
// Run:
//   go run go/cultural_moral_judgment_score.go

package main

import "fmt"

func dotProduct(weights []float64, values []float64) float64 {
	total := 0.0

	for i := range weights {
		total += weights[i] * values[i]
	}

	return total
}

func main() {
	contextWeights := []float64{0.30, 0.25, 0.25, 0.20, 0.15, 0.20}
	moralValues := []float64{0.8, 0.6, 0.5, 0.4, 0.2, 0.7}

	judgment := dotProduct(contextWeights, moralValues)

	fmt.Printf("Synthetic culturally weighted moral judgment: %.3f\n", judgment)
}
