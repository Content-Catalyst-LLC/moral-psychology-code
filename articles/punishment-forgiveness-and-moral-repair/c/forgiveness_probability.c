/*
Synthetic forgiveness probability example.
Educational scaffold only.

Compile:
  cc c/forgiveness_probability.c -lm -o outputs/tables/forgiveness_probability_c
Run:
  ./outputs/tables/forgiveness_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double acknowledgment = 0.8;
    double amends = 0.7;
    double ongoing_threat = 0.4;
    double victim_recognition = 0.6;

    double latent =
        0.35 * acknowledgment +
        0.30 * amends -
        0.40 * ongoing_threat +
        0.15 * victim_recognition;

    double probability = logistic(latent);

    printf("Synthetic forgiveness probability: %.3f\n", probability);
    return 0;
}
