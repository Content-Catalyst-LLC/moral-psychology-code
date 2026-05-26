// Synthetic historical moral psychology profile.
// Educational scaffold only.
//
// Run:
//   go run go/history_profile.go

package main

import "fmt"

func main() {
	modes := map[string]float64{
		"sentiment":                0.45,
		"reason":                   0.40,
		"development":              0.45,
		"intuition":                0.75,
		"culture_politics":         0.85,
		"neuroscience_experiment":  0.80,
		"institutions":             0.90,
	}

	dominantMode := ""
	maxValue := -1.0
	fieldCenterScore := 0.0

	for mode, value := range modes {
		fieldCenterScore += value
		if value > maxValue {
			maxValue = value
			dominantMode = mode
		}
	}

	fmt.Printf("Synthetic field-center score: %.3f\n", fieldCenterScore)
	fmt.Printf("Synthetic dominant mode: %s (%.3f)\n", dominantMode, maxValue)
}
