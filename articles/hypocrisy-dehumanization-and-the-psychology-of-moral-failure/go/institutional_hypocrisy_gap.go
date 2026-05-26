// Synthetic institutional hypocrisy gap example.
// Educational scaffold only.
//
// Run:
//   go run go/institutional_hypocrisy_gap.go

package main

import "fmt"

func main() {
	publicValueClaim := 0.9
	actualPracticeIntegrity := 0.4

	institutionalHypocrisy := publicValueClaim - actualPracticeIntegrity

	fmt.Printf("Synthetic institutional hypocrisy gap: %.3f\n", institutionalHypocrisy)
}
