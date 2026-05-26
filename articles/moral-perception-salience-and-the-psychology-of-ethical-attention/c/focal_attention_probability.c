/*
Synthetic focal moral attention probability.
Educational scaffold only.

Compile:
  cc c/focal_attention_probability.c -lm -o outputs/tables/focal_attention_probability_c
Run:
  ./outputs/tables/focal_attention_probability_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double perceived_harm = 0.8;
    double visible_vulnerability = 0.7;
    double emotional_activation = 0.4;
    double mind_perception = 0.8;
    double contextual_framing = 0.5;
    double attentional_competition = 0.3;
    double organized_inattention = 0.4;

    double latent =
        0.60 * perceived_harm +
        0.50 * visible_vulnerability +
        0.35 * emotional_activation +
        0.40 * mind_perception +
        0.25 * contextual_framing -
        0.45 * attentional_competition -
        0.35 * organized_inattention;

    double probability = logistic(latent);

    printf("Synthetic focal moral attention probability: %.3f\n", probability);
    return 0;
}
