/*
Synthetic moral identity action probability example.
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
    double moral_judgment = 0.7;
    double moral_identity = 0.9;
    double self_regulatory_capacity = 0.6;
    double situational_pressure = 0.5;

    double latent =
        0.35 * moral_judgment +
        0.45 * moral_identity +
        0.30 * self_regulatory_capacity -
        0.40 * situational_pressure;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
