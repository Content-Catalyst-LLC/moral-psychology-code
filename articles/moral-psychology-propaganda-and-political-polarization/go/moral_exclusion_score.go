// Synthetic moral exclusion score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_exclusion_score.go

package main

import (
	"fmt"
	"math"
)

func logistic(x float64) float64 {
	return 1.0 / (1.0 + math.Exp(-x))
}

func main() {
	threat := 1.0
	propaganda := 0.8
	outrage := 0.7
	identity := 0.6
	democraticTrust := 0.4
	contact := 0.3

	latent := 0.35*threat +
		0.30*propaganda +
		0.25*outrage +
		0.20*identity -
		0.25*democraticTrust -
		0.20*contact

	risk := logistic(latent)

	fmt.Printf("Synthetic moral exclusion risk: %.3f\n", risk)
}
