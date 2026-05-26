/*
Synthetic childhood/adolescence moral action probability example.
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
    double latent_moral_development = 0.8;
    double empathic_concern = 0.6;
    double school_climate = 0.5;
    double peer_status_pressure = 0.7;

    double latent =
        0.45 * latent_moral_development +
        0.30 * empathic_concern +
        0.25 * school_climate -
        0.30 * peer_status_pressure;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
