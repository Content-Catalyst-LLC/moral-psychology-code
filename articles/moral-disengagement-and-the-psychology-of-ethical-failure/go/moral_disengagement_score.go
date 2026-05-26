// Synthetic moral disengagement score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_disengagement_score.go

package main

import "fmt"

func main() {
	moralJustification := 0.7
	euphemisticLanguage := 0.6
	advantageousComparison := 0.5
	responsibilityShifting := 0.8
	consequenceDistortion := 0.6
	dehumanization := 0.4
	victimBlaming := 0.3
	consequenceVisibility := 0.2
	victimRecognition := 0.2

	moralDisengagement := 0.30*moralJustification +
		0.25*euphemisticLanguage +
		0.20*advantageousComparison +
		0.30*responsibilityShifting +
		0.25*consequenceDistortion +
		0.25*dehumanization +
		0.20*victimBlaming -
		0.20*consequenceVisibility -
		0.20*victimRecognition

	fmt.Printf("Synthetic moral disengagement score: %.3f\n", moralDisengagement)
}
