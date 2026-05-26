// Synthetic pluralist value-gap example.
// Educational scaffold only.
//
// Run:
//   go run go/pluralist_value_gap.go

package main

import (
	"fmt"
	"math"
)

func valueGap(a []float64, b []float64) float64 {
	total := 0.0

	for i := range a {
		total += math.Abs(a[i] - b[i])
	}

	return total
}

func main() {
	personA := []float64{0.8, 0.7, 0.2, 0.1, 0.2, 0.8}
	personB := []float64{0.3, 0.4, 0.8, 0.7, 0.6, 0.4}

	fmt.Printf("Synthetic pluralist value gap: %.3f\n", valueGap(personA, personB))
}
