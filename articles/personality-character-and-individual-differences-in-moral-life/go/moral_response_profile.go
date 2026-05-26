// Synthetic moral response profile example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_response_profile.go

package main

import "fmt"

func main() {
	broadPersonality := 0.4
	characterStrength := 0.8
	moralIdentity := 0.7
	empathy := 0.6
	selfRegulation := 0.5
	humility := 0.4
	selfInterestBias := 0.3

	profile := 0.20*broadPersonality +
		0.30*characterStrength +
		0.35*moralIdentity +
		0.25*empathy +
		0.20*selfRegulation +
		0.15*humility -
		0.35*selfInterestBias

	fmt.Printf("Synthetic moral response profile: %.3f\n", profile)
}
