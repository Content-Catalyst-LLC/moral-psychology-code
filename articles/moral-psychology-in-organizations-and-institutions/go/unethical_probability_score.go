// Synthetic unethical action probability example.
// Educational scaffold only.
//
// Run:
//   go run go/unethical_probability_score.go

package main

import (
	"fmt"
	"math"
)

func logistic(x float64) float64 {
	return 1.0 / (1.0 + math.Exp(-x))
}

func main() {
	performancePressure := 0.9
	hierarchyIntensity := 0.7
	diffusionResponsibility := 0.8
	accountabilityStrength := 0.5
	culturalClimate := 0.4
	speakUpProtection := 0.3
	valueAlignment := 0.4
	corruptionPressure := 0.6

	latent := 0.35*performancePressure +
		0.25*hierarchyIntensity +
		0.30*diffusionResponsibility -
		0.40*accountabilityStrength -
		0.25*culturalClimate -
		0.20*speakUpProtection -
		0.25*valueAlignment +
		0.30*corruptionPressure

	probability := logistic(latent)

	fmt.Printf("Synthetic unethical action probability: %.3f\n", probability)
}
