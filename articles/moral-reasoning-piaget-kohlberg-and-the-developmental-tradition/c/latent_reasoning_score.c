/*
Synthetic latent developmental moral reasoning score.
Educational scaffold only.

Compile:
  cc c/latent_reasoning_score.c -o outputs/tables/latent_reasoning_score_c
Run:
  ./outputs/tables/latent_reasoning_score_c
*/

#include <stdio.h>

int main(void) {
    double age = 15.0;
    double perspective_taking = 0.7;
    double norm_exposure = 0.4;
    double domain_differentiation = 0.8;
    double peer_cooperation = 0.6;
    double cultural_context_support = 0.5;
    double authority_orientation = 0.3;

    double latent_reasoning =
        0.10 * age +
        0.55 * perspective_taking +
        0.35 * norm_exposure +
        0.45 * domain_differentiation +
        0.25 * peer_cooperation +
        0.20 * cultural_context_support -
        0.20 * authority_orientation;

    printf("Synthetic latent moral reasoning score: %.3f\n", latent_reasoning);
    return 0;
}
