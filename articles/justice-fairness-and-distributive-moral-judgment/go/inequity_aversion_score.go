// Synthetic inequity-aversion score example.
// Educational scaffold only.
//
// Run:
//   go run go/inequity_aversion_score.go

package main

import (
	"fmt"
	"math"
)

func main() {
	equalityWeight := -0.8
	needWeight := 0.7
	selfInterestBias := 0.3

	inequityAversion := 0.45*math.Abs(equalityWeight) +
		0.30*needWeight -
		0.25*selfInterestBias

	fmt.Printf("Synthetic inequity-aversion score: %.3f\n", inequityAversion)
}
