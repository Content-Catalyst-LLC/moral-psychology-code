/*
Synthetic adult moral action probability example.
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
    double voice_safety = 0.5;
    double accountability_strength = 0.7;
    double caregiving_burden = 0.4;

    double latent =
        0.45 * latent_moral_development +
        0.25 * voice_safety +
        0.25 * accountability_strength -
        0.25 * caregiving_burden;

    double probability = logistic(latent);

    printf("Synthetic adult moral action probability: %.3f\n", probability);
    return 0;
}
