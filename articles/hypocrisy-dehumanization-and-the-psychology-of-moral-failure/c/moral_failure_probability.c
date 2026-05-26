/*
Synthetic moral failure probability example.
Educational scaffold only.

Compile:
  cc c/moral_failure_probability.c -lm -o outputs/tables/moral_failure_probability_c
Run:
  ./outputs/tables/moral_failure_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double hypocrisy = 0.8;
    double dehumanization = 0.7;
    double ingroup_bias = 0.5;
    double institutional_hypocrisy = 0.6;
    double empathic_recognition = 0.3;
    double accountability_strength = 0.4;
    double victim_visibility = 0.2;

    double latent =
        0.45 * hypocrisy +
        0.40 * dehumanization +
        0.30 * ingroup_bias +
        0.25 * institutional_hypocrisy -
        0.35 * empathic_recognition -
        0.25 * accountability_strength -
        0.20 * victim_visibility;

    double probability = logistic(latent);

    printf("Synthetic moral failure probability: %.3f\n", probability);
    return 0;
}
