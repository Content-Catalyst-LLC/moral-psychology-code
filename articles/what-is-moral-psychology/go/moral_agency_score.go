// Synthetic moral agency score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_agency_score.go

package main

import "fmt"

func main() {
	moralSalience := 0.7
	moralJudgment := 0.8
	moralEmotion := 0.5
	moralIdentity := 0.6
	selfRegulation := 0.8
	institutionalPressure := 0.4

	moralActionScore := 0.25*moralSalience +
		0.30*moralJudgment +
		0.15*moralEmotion +
		0.20*moralIdentity +
		0.20*selfRegulation -
		0.25*institutionalPressure

	fmt.Printf("Synthetic moral action score: %.3f\n", moralActionScore)
}
