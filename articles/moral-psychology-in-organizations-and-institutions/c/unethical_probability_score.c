/*
Synthetic unethical action probability example.
Educational scaffold only.

Compile:
  cc c/unethical_probability_score.c -lm -o outputs/tables/unethical_probability_score_c
Run:
  ./outputs/tables/unethical_probability_score_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double performance_pressure = 0.9;
    double hierarchy_intensity = 0.7;
    double diffusion_responsibility = 0.8;
    double accountability_strength = 0.5;
    double cultural_climate = 0.4;
    double speak_up_protection = 0.3;
    double value_alignment = 0.4;
    double corruption_pressure = 0.6;

    double latent =
        0.35 * performance_pressure +
        0.25 * hierarchy_intensity +
        0.30 * diffusion_responsibility -
        0.40 * accountability_strength -
        0.25 * cultural_climate -
        0.20 * speak_up_protection -
        0.25 * value_alignment +
        0.30 * corruption_pressure;

    double probability = logistic(latent);

    printf("Synthetic unethical action probability: %.3f\n", probability);
    return 0;
}
