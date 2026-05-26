// Synthetic moral action score under judgment and pressure.
// Educational scaffold only.
//
// Run:
//   go run go/moral_action_score.go

package main

import "fmt"

func main() {
	moralJudgment := 0.8
	emotionalActivation := 0.6
	moralIdentity := 0.7
	selfRegulation := 0.6
	situationalPressure := 0.5
	rationalizationTendency := 0.3

	score := 0.45*moralJudgment +
		0.30*emotionalActivation +
		0.35*moralIdentity +
		0.40*selfRegulation -
		0.50*situationalPressure -
		0.25*rationalizationTendency

	fmt.Printf("Synthetic moral action latent score: %.3f\n", score)
}
