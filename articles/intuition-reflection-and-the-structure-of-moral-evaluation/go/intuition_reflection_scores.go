// Synthetic intuition-reflection score example.
// Educational scaffold only.
//
// Run:
//   go run go/intuition_reflection_scores.go

package main

import "fmt"

func main() {
	perceivedHarm := 0.9
	affectiveActivation := 0.7
	socialSalience := 0.5
	principledReasoning := 0.8
	evidentialReconsideration := 0.6
	contextualKnowledge := 0.7
	intuitionWeight := 0.55

	intuitiveAppraisal := 0.55*perceivedHarm +
		0.45*affectiveActivation +
		0.30*socialSalience

	reflectiveEvaluation := 0.40*principledReasoning +
		0.35*evidentialReconsideration +
		0.30*contextualKnowledge

	finalMoralEvaluation := intuitionWeight*intuitiveAppraisal +
		(1-intuitionWeight)*reflectiveEvaluation

	reflectiveRevision := reflectiveEvaluation - intuitiveAppraisal

	fmt.Printf("Synthetic intuitive appraisal: %.3f\n", intuitiveAppraisal)
	fmt.Printf("Synthetic reflective evaluation: %.3f\n", reflectiveEvaluation)
	fmt.Printf("Synthetic final moral evaluation: %.3f\n", finalMoralEvaluation)
	fmt.Printf("Synthetic reflective revision: %.3f\n", reflectiveRevision)
}
