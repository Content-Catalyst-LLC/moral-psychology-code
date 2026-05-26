/*
Synthetic prosocial action probability example.
Educational scaffold only.

Compile:
  cc c/prosocial_action_probability.c -lm -o outputs/tables/prosocial_action_probability_c
Run:
  ./outputs/tables/prosocial_action_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double empathic_concern = 0.8;
    double norm_strength = 0.6;
    double relational_closeness = 0.5;
    double visible_vulnerability = 0.7;
    double perceived_cost = 0.4;
    double institutional_support = 0.5;

    double latent =
        0.40 * empathic_concern +
        0.30 * norm_strength +
        0.25 * relational_closeness +
        0.30 * visible_vulnerability -
        0.35 * perceived_cost +
        0.18 * institutional_support;

    double probability = logistic(latent);

    printf("Synthetic prosocial action probability: %.3f\n", probability);
    return 0;
}
