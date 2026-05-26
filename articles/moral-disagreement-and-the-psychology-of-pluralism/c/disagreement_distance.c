/*
Synthetic moral disagreement distance example.
Educational scaffold only.

Compile:
  cc c/disagreement_distance.c -lm -o outputs/tables/disagreement_distance_c
Run:
  ./outputs/tables/disagreement_distance_c
*/

#include <math.h>
#include <stdio.h>

double moral_judgment(double harm, double fairness, double loyalty, double purity, double authority, double care) {
    return 0.40 * harm +
           0.30 * fairness +
           0.20 * loyalty +
           0.15 * purity +
           0.15 * authority +
           0.25 * care;
}

int main(void) {
    double judgment_a = moral_judgment(0.8, 0.7, 0.2, 0.1, 0.2, 0.8);
    double judgment_b = moral_judgment(0.3, 0.4, 0.8, 0.7, 0.6, 0.4);
    double distance = fabs(judgment_a - judgment_b);

    printf("Synthetic judgment A: %.3f\n", judgment_a);
    printf("Synthetic judgment B: %.3f\n", judgment_b);
    printf("Synthetic disagreement distance: %.3f\n", distance);

    return 0;
}
