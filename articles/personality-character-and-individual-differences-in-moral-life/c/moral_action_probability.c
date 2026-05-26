/*
Synthetic moral action probability example.
Educational scaffold only.

Compile:
  cc c/moral_action_probability.c -lm -o outputs/tables/moral_action_probability_c
Run:
  ./outputs/tables/moral_action_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double moral_response_profile = 0.8;
    double situational_pressure = 0.6;
    double voice_safety = 0.5;
    double accountability_strength = 0.7;

    double latent =
        0.45 * moral_response_profile -
        0.35 * situational_pressure +
        0.25 * voice_safety +
        0.25 * accountability_strength;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
