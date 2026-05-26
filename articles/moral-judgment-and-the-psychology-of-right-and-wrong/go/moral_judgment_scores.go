// Synthetic moral judgment score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_judgment_scores.go

package main

import "fmt"

func main() {
	perceivedHarm := 0.8
	normViolation := 0.7
	inferredIntention := 0.6
	emotionalActivation := 0.4
	socialPressure := 0.3
	situationalAmbiguity := 0.2
	perceivedAgency := 0.8
	repairOpportunity := 0.3

	latentWrongness := 0.70*perceivedHarm +
		0.55*normViolation +
		0.50*inferredIntention +
		0.25*emotionalActivation +
		0.20*socialPressure -
		0.30*situationalAmbiguity

	blameScore := 0.60*latentWrongness +
		0.45*perceivedAgency -
		0.35*repairOpportunity +
		0.15*emotionalActivation -
		0.15*situationalAmbiguity

	fmt.Printf("Synthetic latent wrongness: %.3f\n", latentWrongness)
	fmt.Printf("Synthetic blame score: %.3f\n", blameScore)
}
