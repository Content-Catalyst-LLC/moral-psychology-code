/*
Synthetic measurement score example for Methods in Moral Psychology.
Educational scaffold only.

Compile:
  cc c/measurement_score.c -o outputs/tables/measurement_score_c
Run:
  ./outputs/tables/measurement_score_c
*/

#include <stdio.h>

double latent_construct(double wrongness, double blame, double norm_learning, double action_tendency) {
    return 0.35 * wrongness
         + 0.30 * blame
         + 0.20 * norm_learning
         + 0.15 * action_tendency;
}

int main(void) {
    double score = latent_construct(0.8, 0.6, 0.7, 0.5);
    printf("Synthetic latent moral construct score: %.3f\n", score);
    return 0;
}
