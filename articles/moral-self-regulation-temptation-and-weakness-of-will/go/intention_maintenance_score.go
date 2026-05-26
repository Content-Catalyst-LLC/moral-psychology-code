// Synthetic intention maintenance score example.
// Educational scaffold only.
//
// Run:
//   go run go/intention_maintenance_score.go

package main

import "fmt"

func main() {
	initialIntention := 0.7
	moralJudgment := 0.8
	temptationIntensity := 0.5
	fatigue := 0.4

	nextIntention := initialIntention +
		0.30*moralJudgment -
		0.25*temptationIntensity -
		0.20*fatigue

	fmt.Printf("Synthetic next-period intention strength: %.3f\n", nextIntention)
}
