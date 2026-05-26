// Synthetic moral-emotion score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_emotion_scores.go

package main

import "fmt"

func main() {
	perceivedWrongdoing := 0.8
	specificResponsibility := 0.7
	globalSelfCondemnation := 0.5
	exposureBeforeOthers := 0.4
	perceivedViolation := 0.6
	boundaryThreat := 0.5
	perceivedSuffering := 0.9
	mindPerception := 0.8
	admiredMoralAction := 0.7
	perceivedMoralExcellence := 0.8

	guilt := 0.55*perceivedWrongdoing + 0.50*specificResponsibility
	shame := 0.60*globalSelfCondemnation + 0.45*exposureBeforeOthers
	disgust := 0.60*perceivedViolation + 0.40*boundaryThreat
	compassion := 0.65*perceivedSuffering + 0.35*mindPerception
	elevation := 0.60*admiredMoralAction + 0.45*perceivedMoralExcellence

	fmt.Printf("Synthetic guilt score: %.3f\n", guilt)
	fmt.Printf("Synthetic shame score: %.3f\n", shame)
	fmt.Printf("Synthetic disgust score: %.3f\n", disgust)
	fmt.Printf("Synthetic compassion score: %.3f\n", compassion)
	fmt.Printf("Synthetic elevation score: %.3f\n", elevation)
}
