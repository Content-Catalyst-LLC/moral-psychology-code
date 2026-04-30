package main

import "fmt"

func moralAgency(perception, judgment, emotion, identity, regulation, repair, failure float64) float64 {
	return 0.13*perception + 0.13*judgment + 0.12*emotion + 0.14*identity + 0.14*regulation + 0.12*repair - 0.16*failure
}

func main() {
	score := moralAgency(0.72, 0.70, 0.62, 0.68, 0.64, 0.58, 0.32)
	fmt.Printf("Moral agency score: %.3f\n", score)
}
