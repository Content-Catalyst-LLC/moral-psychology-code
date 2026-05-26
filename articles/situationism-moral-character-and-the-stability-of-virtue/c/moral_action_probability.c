/*
Synthetic situationism moral action probability example.
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
    double character_strength = 0.8;
    double habit_strength = 0.6;
    double situational_pressure = 0.7;
    double voice_safety = 0.4;
    double accountability_visibility = 0.5;
    double depletion = 0.3;

    double latent =
        0.42 * character_strength +
        0.25 * habit_strength -
        0.55 * situational_pressure +
        0.25 * voice_safety +
        0.25 * accountability_visibility -
        0.20 * depletion -
        0.22 * character_strength * situational_pressure;

    double probability = logistic(latent);

    printf("Synthetic moral action probability: %.3f\n", probability);
    return 0;
}
