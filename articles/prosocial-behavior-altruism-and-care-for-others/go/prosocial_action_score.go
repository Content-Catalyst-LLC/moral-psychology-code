// Synthetic prosocial action score example.
// Educational scaffold only.
//
// Run:
//   go run go/prosocial_action_score.go

package main

import "fmt"

func main() {
	empathicConcern := 0.8
	normStrength := 0.6
	relationalCloseness := 0.5
	visibleVulnerability := 0.7
	perceivedCost := 0.4
	institutionalSupport := 0.5

	score := 0.40*empathicConcern +
		0.30*normStrength +
		0.25*relationalCloseness +
		0.30*visibleVulnerability -
		0.35*perceivedCost +
		0.18*institutionalSupport

	fmt.Printf("Synthetic prosocial action score: %.3f\n", score)
}
