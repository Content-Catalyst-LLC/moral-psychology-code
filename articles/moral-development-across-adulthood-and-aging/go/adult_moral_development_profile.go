// Synthetic adult moral-development profile example.
// Educational scaffold only.
//
// Run:
//   go run go/adult_moral_development_profile.go

package main

import "fmt"

func main() {
	age := 62.0
	moralIdentity := 0.7
	prosocialOrientation := 0.8
	roleComplexity := 0.5
	moralEmotionProfile := 0.6
	decisionCapacity := 0.4
	generativity := 0.9
	caregivingBurden := 0.3
	lossReflection := 0.6

	profile := 0.03*age -
		0.00025*age*age +
		0.35*moralIdentity +
		0.40*prosocialOrientation +
		0.30*roleComplexity +
		0.25*moralEmotionProfile +
		0.20*decisionCapacity +
		0.25*generativity -
		0.20*caregivingBurden +
		0.15*lossReflection

	fmt.Printf("Synthetic adult moral-development profile: %.3f\n", profile)
}
