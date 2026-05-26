// Synthetic person-situation moral action score example.
// Educational scaffold only.
//
// Run:
//   go run go/person_situation_score.go

package main

import "fmt"

func main() {
	characterStrength := 0.8
	selfRegulation := 0.6
	habitStrength := 0.7
	moralIdentity := 0.5
	situationalPressure := 0.9
	voiceSafety := 0.4
	accountabilityVisibility := 0.5
	depletion := 0.3

	score := 0.42*characterStrength +
		0.28*selfRegulation +
		0.25*habitStrength +
		0.22*moralIdentity -
		0.55*situationalPressure +
		0.25*voiceSafety +
		0.25*accountabilityVisibility -
		0.20*depletion -
		0.22*characterStrength*situationalPressure

	fmt.Printf("Synthetic person-situation moral action score: %.3f\n", score)
}
