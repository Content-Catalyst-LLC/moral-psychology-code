/*
Synthetic moral judgment score example for Experimental Moral Psychology.
Educational scaffold only.

Compile:
  cc c/intuition_judgment_score.c -o outputs/tables/intuition_judgment_score_c
Run:
  ./outputs/tables/intuition_judgment_score_c
*/

#include <stdio.h>

double moral_judgment_score(
    double intuition,
    double reflection,
    double norm_sensitivity,
    double consequence_sensitivity
) {
    return 0.30 * intuition
         + 0.20 * reflection
         + 0.25 * norm_sensitivity
         + 0.25 * consequence_sensitivity;
}

int main(void) {
    double score = moral_judgment_score(0.8, 0.4, 0.7, 0.6);
    printf("Synthetic moral judgment score: %.3f\n", score);
    return 0;
}
