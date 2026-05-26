// Synthetic sustainable care score example.
// Educational scaffold only.
//
// Run:
//   go run go/care_sustainability_score.go

package main

import "fmt"

func main() {
	humaneWorkload := 0.7
	voiceSafety := 0.6
	accountability := 0.5
	resources := 0.8
	overload := 0.4

	sustainableCare := 0.30*humaneWorkload +
		0.25*voiceSafety +
		0.25*accountability +
		0.30*resources -
		0.35*overload

	fmt.Printf("Synthetic sustainable care score: %.3f\n", sustainableCare)
}
