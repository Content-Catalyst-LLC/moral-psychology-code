/*
Synthetic unethical action probability example.
Educational scaffold only.

Compile:
  cc c/unethical_action_probability.c -lm -o outputs/tables/unethical_action_probability_c
Run:
  ./outputs/tables/unethical_action_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double moral_disengagement = 0.8;
    double anticipated_guilt = 0.3;
    double institutional_pressure = 0.6;
    double accountability_strength = 0.4;

    double latent =
        0.55 * moral_disengagement -
        0.35 * anticipated_guilt +
        0.30 * institutional_pressure -
        0.25 * accountability_strength;

    double probability = logistic(latent);

    printf("Synthetic unethical action probability: %.3f\n", probability);
    return 0;
}
