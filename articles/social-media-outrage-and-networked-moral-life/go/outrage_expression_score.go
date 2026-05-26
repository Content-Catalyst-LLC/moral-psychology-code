// Synthetic public outrage expression score example.
// Educational scaffold only.
//
// Run:
//   go run go/outrage_expression_score.go

package main

import (
	"fmt"
	"math"
)

func logistic(x float64) float64 {
	return 1.0 / (1.0 + math.Exp(-x))
}

func main() {
	outrage := 0.8
	reward := 0.7
	amplification := 0.6
	identity := 0.5
	correction := 0.3

	latent := 0.35*outrage +
		0.30*reward +
		0.25*amplification +
		0.25*identity -
		0.15*correction

	probability := logistic(latent)

	fmt.Printf("Synthetic public outrage expression probability: %.3f\n", probability)
}
