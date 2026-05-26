// Synthetic accountability score example.
// Educational scaffold only.
//
// Run:
//   go run go/accountability_score.go

package main

import "fmt"

func main() {
	responsibility := 0.8
	institutionalStructure := 0.6
	wrongnessSeverity := 0.7
	repairCapacity := 0.5
	preventionCapacity := 0.4

	accountability := 0.45*responsibility +
		0.25*institutionalStructure +
		0.20*wrongnessSeverity +
		0.20*repairCapacity +
		0.15*preventionCapacity

	fmt.Printf("Synthetic accountability score: %.3f\n", accountability)
}
