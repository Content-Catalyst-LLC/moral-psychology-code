// Synthetic developmental moral reasoning profile example.
// Educational scaffold only.
//
// Run:
//   go run go/moral_reasoning_profile.go

package main

import "fmt"

func main() {
	age := 15.0
	perspectiveTaking := 0.7
	normExposure := 0.4
	domainDifferentiation := 0.8
	relationalOrientation := 0.6
	authorityOrientation := 0.3
	peerCooperation := 0.6
	culturalContextSupport := 0.5

	latentReasoning := 0.10*age +
		0.55*perspectiveTaking +
		0.35*normExposure +
		0.45*domainDifferentiation +
		0.25*peerCooperation +
		0.20*culturalContextSupport -
		0.20*authorityOrientation

	justiceReasoning := 0.60*latentReasoning +
		0.25*perspectiveTaking +
		0.20*domainDifferentiation

	careReasoning := 0.35*latentReasoning +
		0.50*relationalOrientation +
		0.20*perspectiveTaking

	fmt.Printf("Synthetic latent reasoning: %.3f\n", latentReasoning)
	fmt.Printf("Synthetic justice reasoning: %.3f\n", justiceReasoning)
	fmt.Printf("Synthetic care reasoning: %.3f\n", careReasoning)
}
