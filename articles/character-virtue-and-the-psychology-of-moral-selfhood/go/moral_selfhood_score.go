// Synthetic moral selfhood score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_selfhood_score.go

package main

import "fmt"

func main() {
	characterStrength := 0.8
	identityIntegration := 0.7
	accountability := 0.6
	repairCapacity := 0.7
	selfRegulation := 0.6

	moralSelfhood := 0.40*characterStrength +
		0.30*identityIntegration +
		0.25*accountability +
		0.30*repairCapacity +
		0.20*selfRegulation

	fmt.Printf("Synthetic moral selfhood score: %.3f\n", moralSelfhood)
}
