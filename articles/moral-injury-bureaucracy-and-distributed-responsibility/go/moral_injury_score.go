// Synthetic moral injury risk example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_injury_score.go

package main

import (
	"fmt"
	"math"
)

func logistic(x float64) float64 {
	return 1.0 / (1.0 + math.Exp(-x))
}

func main() {
	conscienceConflict := 0.9
	institutionalBetrayal := 0.8
	distributedResponsibility := 0.7
	exposure := 0.8
	scarcity := 0.6
	accountability := 0.4
	protectedVoice := 0.3
	repairCapacity := 0.3

	latent := 0.30*conscienceConflict +
		0.30*institutionalBetrayal +
		0.25*distributedResponsibility +
		0.30*exposure +
		0.20*scarcity -
		0.25*accountability -
		0.20*protectedVoice -
		0.20*repairCapacity

	risk := logistic(latent)

	fmt.Printf("Synthetic moral injury risk: %.3f\n", risk)
}
