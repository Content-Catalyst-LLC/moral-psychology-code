/*
Synthetic diversification score for historical moral psychology emphases.
Educational scaffold only.

Compile:
  cc c/diversification_score.c -lm -o outputs/tables/diversification_score_c
Run:
  ./outputs/tables/diversification_score_c
*/

#include <math.h>
#include <stdio.h>

int main(void) {
    double values[] = {0.45, 0.40, 0.45, 0.75, 0.85, 0.80, 0.90};
    int n = 7;
    double total = 0.0;
    double entropy = 0.0;

    for (int i = 0; i < n; i++) {
        total += values[i];
    }

    for (int i = 0; i < n; i++) {
        double p = values[i] / total;
        if (p > 0.0) {
            entropy -= p * log(p);
        }
    }

    double normalized = entropy / log((double)n);

    printf("Synthetic normalized diversification score: %.3f\n", normalized);

    return 0;
}
