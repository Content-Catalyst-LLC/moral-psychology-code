// Synthetic moral exclusion risk example.
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
	dehumanizingRhetoric := 0.8
	loyaltyPressure := 0.7
	identityStrength := 0.6
	institutionalTrust := 0.4
	crossGroupContact := 0.3

	latent := 0.35*threat +
		0.30*dehumanizingRhetoric +
		0.25*loyaltyPressure +
		0.20*identityStrength -
		0.25*institutionalTrust -
		0.20*crossGroupContact

	risk := logistic(latent)

	fmt.Printf("Synthetic moral exclusion risk: %.3f\n", risk)
}
