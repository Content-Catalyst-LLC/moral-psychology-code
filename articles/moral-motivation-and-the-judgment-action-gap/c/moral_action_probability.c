/*
Synthetic moral action probability under judgment and pressure.
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
    double moral_judgment = 0.8;
    double emotional_activation = 0.6;
    double moral_identity = 0.7;
    double self_regulation = 0.6;
    double situational_pressure = 0.5;
    double rationalization_tendency = 0.3;

    double latent =
        0.45 * moral_judgment +
        0.30 * emotional_activation +
        0.35 * moral_identity +
        0.40 * self_regulation -
        0.50 * situational_pressure -
        0.25 * rationalization_tendency;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
