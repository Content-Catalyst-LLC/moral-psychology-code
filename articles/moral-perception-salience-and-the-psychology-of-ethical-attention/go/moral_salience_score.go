// Synthetic moral salience score example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_salience_score.go

package main

import "fmt"

func main() {
	perceivedHarm := 0.8
	visibleVulnerability := 0.7
	emotionalActivation := 0.4
	mindPerception := 0.8
	contextualFraming := 0.5
	attentionalCompetition := 0.3
	organizedInattention := 0.4

	latentSalience := 0.60*perceivedHarm +
		0.50*visibleVulnerability +
		0.35*emotionalActivation +
		0.40*mindPerception +
		0.25*contextualFraming -
		0.45*attentionalCompetition -
		0.35*organizedInattention

	fmt.Printf("Synthetic latent moral salience score: %.3f\n", latentSalience)
}
