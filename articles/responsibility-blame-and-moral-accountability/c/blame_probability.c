/*
Synthetic blame probability example.
Educational scaffold only.

Compile:
  cc c/blame_probability.c -lm -o outputs/tables/blame_probability_c
Run:
  ./outputs/tables/blame_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double responsibility = 0.8;
    double wrongness_severity = 0.7;
    double motive_malice = 0.5;
    double mitigating_excuse = 0.4;

    double latent =
        0.40 * responsibility +
        0.35 * wrongness_severity +
        0.25 * motive_malice -
        0.30 * mitigating_excuse;

    double probability = logistic(latent);

    printf("Synthetic blame probability: %.3f\n", probability);
    return 0;
}
