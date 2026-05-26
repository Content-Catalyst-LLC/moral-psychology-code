/*
Synthetic public outrage expression score example.
Educational scaffold only.

Compile:
  cc c/outrage_expression_score.c -lm -o outputs/tables/outrage_expression_score_c
Run:
  ./outputs/tables/outrage_expression_score_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double outrage = 0.8;
    double reward = 0.7;
    double amplification = 0.6;
    double identity = 0.5;
    double correction = 0.3;

    double latent =
        0.35 * outrage +
        0.30 * reward +
        0.25 * amplification +
        0.25 * identity -
        0.15 * correction;

    double probability = logistic(latent);

    printf("Synthetic public outrage expression probability: %.3f\n", probability);
    return 0;
}
