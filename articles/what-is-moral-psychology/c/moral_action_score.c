/*
Synthetic moral action score.
Educational scaffold only.

Compile:
  cc c/moral_action_score.c -o outputs/tables/moral_action_score_c
Run:
  ./outputs/tables/moral_action_score_c
*/

#include <stdio.h>

int main(void) {
    double moral_salience = 0.7;
    double moral_judgment = 0.8;
    double moral_emotion = 0.5;
    double moral_identity = 0.6;
    double self_regulation = 0.8;
    double institutional_pressure = 0.4;

    double moral_action_score =
        0.25 * moral_salience +
        0.30 * moral_judgment +
        0.15 * moral_emotion +
        0.20 * moral_identity +
        0.20 * self_regulation -
        0.25 * institutional_pressure;

    printf("Synthetic moral action score: %.3f\n", moral_action_score);
    return 0;
}
