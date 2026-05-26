/*
Synthetic helping probability from differentiated moral emotions.
Educational scaffold only.

Compile:
  cc c/helping_probability.c -lm -o outputs/tables/helping_probability_c
Run:
  ./outputs/tables/helping_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double guilt = 0.7;
    double compassion = 0.8;
    double elevation = 0.6;
    double shame = 0.3;
    double disgust = 0.2;
    double repair_pathway = 0.6;

    double latent =
        0.35 * guilt +
        0.45 * compassion +
        0.30 * elevation -
        0.20 * shame -
        0.15 * disgust +
        0.20 * repair_pathway;

    double probability = logistic(latent);

    printf("Synthetic helping probability: %.3f\n", probability);
    return 0;
}
