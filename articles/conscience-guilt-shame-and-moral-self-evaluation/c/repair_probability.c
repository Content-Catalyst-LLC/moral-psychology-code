/*
Synthetic repair probability from guilt, shame, empathy, and repair pathway.
Educational scaffold only.

Compile:
  cc c/repair_probability.c -lm -o outputs/tables/repair_probability_c
Run:
  ./outputs/tables/repair_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double guilt = 0.8;
    double shame = 0.4;
    double empathic_acknowledgment = 0.7;
    double repair_pathway = 0.6;
    double agency_capacity = 0.6;
    double defensiveness = 0.2;

    double latent =
        0.50 * guilt -
        0.30 * shame +
        0.35 * empathic_acknowledgment +
        0.30 * repair_pathway +
        0.20 * agency_capacity -
        0.25 * defensiveness;

    double probability = logistic(latent);

    printf("Synthetic repair probability: %.3f\n", probability);
    return 0;
}
