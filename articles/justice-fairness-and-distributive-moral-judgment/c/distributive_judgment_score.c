/*
Synthetic distributive judgment score example.
Educational scaffold only.

Compile:
  cc c/distributive_judgment_score.c -o outputs/tables/distributive_judgment_score_c
Run:
  ./outputs/tables/distributive_judgment_score_c
*/

#include <stdio.h>

double distributive_judgment(
    double equality,
    double equity,
    double need,
    double desert,
    double priority,
    double self_interest_bias,
    double procedural_trust,
    double group_distance,
    double historical_repair
) {
    return 0.30 * equality +
           0.25 * equity +
           0.25 * need +
           0.20 * desert +
           0.25 * priority -
           0.35 * self_interest_bias +
           0.20 * procedural_trust -
           0.20 * group_distance +
           0.20 * historical_repair;
}

int main(void) {
    double score = distributive_judgment(0.7, 0.4, 0.8, 0.3, 0.6, 0.2, 0.5, 0.1, 0.7);
    printf("Synthetic distributive judgment score: %.3f\n", score);
    return 0;
}
