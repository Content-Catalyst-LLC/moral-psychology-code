// Synthetic moral identity score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_identity_score.go

package main

import "fmt"

func main() {
	internalization := 0.9
	symbolization := 0.4
	narrativeIntegration := 0.7
	normIntegration := 0.6

	moralIdentity := 0.50*internalization +
		0.22*symbolization +
		0.35*narrativeIntegration +
		0.30*normIntegration

	fmt.Printf("Synthetic moral identity score: %.3f\n", moralIdentity)
}
