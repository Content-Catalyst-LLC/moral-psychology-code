// Synthetic childhood/adolescence moral-development profile example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_development_profile.go

package main

import "fmt"

func main() {
	age := 14.0
	perspectiveTaking := 0.7
	empathicConcern := 0.8
	normUnderstanding := 0.6
	peerContext := 0.4
	familySupport := 0.5
	schoolClimate := 0.5
	peerStatusPressure := 0.6

	profile := 0.12*age -
		0.002*age*age +
		0.40*perspectiveTaking +
		0.35*empathicConcern +
		0.38*normUnderstanding +
		0.20*peerContext +
		0.25*familySupport +
		0.20*schoolClimate -
		0.20*peerStatusPressure

	fmt.Printf("Synthetic childhood/adolescence moral-development profile: %.3f\n", profile)
}
