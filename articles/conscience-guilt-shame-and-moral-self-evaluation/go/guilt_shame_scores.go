// Synthetic guilt and shame score example.
// Educational scaffold only.
//
// Run:
//   go run go/guilt_shame_scores.go

package main

import "fmt"

func main() {
	perceivedWrongdoing := 0.8
	perceivedResponsibility := 0.7
	normInternalization := 0.6
	agencyCapacity := 0.5

	globalSelfCondemnation := 0.9
	exposureBeforeOthers := 0.7

	guilt := 0.55*perceivedWrongdoing +
		0.50*perceivedResponsibility +
		0.25*normInternalization +
		0.15*agencyCapacity

	shame := 0.55*globalSelfCondemnation +
		0.45*exposureBeforeOthers +
		0.20*normInternalization -
		0.10*agencyCapacity

	fmt.Printf("Synthetic guilt score: %.3f\n", guilt)
	fmt.Printf("Synthetic shame score: %.3f\n", shame)
}
