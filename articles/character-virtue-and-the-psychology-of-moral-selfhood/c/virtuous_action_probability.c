/*
Synthetic character, virtue, and moral selfhood probability example.
Educational scaffold only.

Compile:
  cc c/virtuous_action_probability.c -lm -o outputs/tables/virtuous_action_probability_c
Run:
  ./outputs/tables/virtuous_action_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double character_strength = 0.8;
    double moral_selfhood_profile = 0.7;
    double situational_pressure = 0.6;
    double institutional_support = 0.5;
    double self_regulation = 0.6;

    double latent =
        0.45 * character_strength +
        0.30 * moral_selfhood_profile -
        0.40 * situational_pressure +
        0.25 * institutional_support +
        0.20 * self_regulation;

    double probability = logistic(latent);

    printf("Synthetic virtuous action probability: %.3f\n", probability);
    return 0;
}
