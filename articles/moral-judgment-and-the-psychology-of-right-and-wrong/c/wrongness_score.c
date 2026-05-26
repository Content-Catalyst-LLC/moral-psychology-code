/*
Synthetic moral wrongness score.
Educational scaffold only.

Compile:
  cc c/wrongness_score.c -o outputs/tables/wrongness_score_c
Run:
  ./outputs/tables/wrongness_score_c
*/

#include <stdio.h>

int main(void) {
    double perceived_harm = 0.8;
    double norm_violation = 0.7;
    double inferred_intention = 0.6;
    double emotional_activation = 0.4;
    double ideological_framing = 0.2;
    double situational_ambiguity = 0.3;

    double latent_wrongness =
        0.65 * perceived_harm +
        0.55 * norm_violation +
        0.50 * inferred_intention +
        0.25 * emotional_activation +
        0.20 * ideological_framing -
        0.30 * situational_ambiguity;

    printf("Synthetic latent wrongness score: %.3f\n", latent_wrongness);
    return 0;
}
