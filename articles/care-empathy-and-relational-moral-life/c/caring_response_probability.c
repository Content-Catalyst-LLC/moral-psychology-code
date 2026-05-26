/*
Synthetic care, empathy, and relational moral life probability example.
Educational scaffold only.

Compile:
  cc c/caring_response_probability.c -lm -o outputs/tables/caring_response_probability_c
Run:
  ./outputs/tables/caring_response_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double empathy = 0.8;
    double felt_responsibility = 0.7;
    double perceived_dependence = 0.6;
    double temporal_persistence = 0.5;
    double burnout = 0.4;
    double institutional_support = 0.6;
    double voice_safety = 0.5;

    double latent =
        0.35 * empathy +
        0.40 * felt_responsibility +
        0.35 * perceived_dependence +
        0.30 * temporal_persistence -
        0.40 * burnout +
        0.25 * institutional_support +
        0.18 * voice_safety;

    double probability = logistic(latent);

    printf("Synthetic caring response probability: %.3f\n", probability);
    return 0;
}
