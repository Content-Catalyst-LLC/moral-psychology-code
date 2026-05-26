/*
Synthetic moral injury risk example.
Educational scaffold only.

Compile:
  cc c/moral_injury_score.c -lm -o outputs/tables/moral_injury_score_c
Run:
  ./outputs/tables/moral_injury_score_c
*/

#include <math.h>
#include <stdio.h>

double logistic(double x) {
    return 1.0 / (1.0 + exp(-x));
}

int main(void) {
    double conscience_conflict = 0.9;
    double institutional_betrayal = 0.8;
    double distributed_responsibility = 0.7;
    double exposure = 0.8;
    double scarcity = 0.6;
    double accountability = 0.4;
    double protected_voice = 0.3;
    double repair_capacity = 0.3;

    double latent =
        0.30 * conscience_conflict +
        0.30 * institutional_betrayal +
        0.25 * distributed_responsibility +
        0.30 * exposure +
        0.20 * scarcity -
        0.25 * accountability -
        0.20 * protected_voice -
        0.20 * repair_capacity;

    double risk = logistic(latent);

    printf("Synthetic moral injury risk: %.3f\n", risk);
    return 0;
}
