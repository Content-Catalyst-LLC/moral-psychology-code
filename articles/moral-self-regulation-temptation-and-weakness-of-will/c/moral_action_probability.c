/*
Synthetic moral action probability under temptation example.
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
    double self_regulatory_capacity = 0.7;
    double moral_identity = 0.6;
    double temptation_intensity = 0.5;
    double fatigue = 0.4;
    double situational_pressure = 0.5;
    double rationalization_tendency = 0.3;

    double latent =
        0.40 * moral_judgment +
        0.35 * self_regulatory_capacity +
        0.25 * moral_identity -
        0.45 * temptation_intensity -
        0.30 * fatigue -
        0.35 * situational_pressure -
        0.25 * rationalization_tendency;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
