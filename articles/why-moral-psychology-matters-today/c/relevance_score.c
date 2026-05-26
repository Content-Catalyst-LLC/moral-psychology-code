/*
Synthetic relevance score example for "Why Moral Psychology Matters Today".
Educational scaffold only.

Compile:
  cc c/relevance_score.c -o outputs/tables/relevance_score_c
Run:
  ./outputs/tables/relevance_score_c
*/

#include <stdio.h>

double relevance_score(
    double political_polarization,
    double organizational_risk,
    double developmental_learning,
    double cross_cultural_variation,
    double technology_amplification,
    double moral_injury_burden
) {
    return 0.25 * political_polarization
         + 0.20 * organizational_risk
         + 0.15 * developmental_learning
         + 0.15 * cross_cultural_variation
         + 0.15 * technology_amplification
         + 0.20 * moral_injury_burden;
}

int main(void) {
    double score = relevance_score(1.2, 0.8, 0.4, 0.5, 1.0, 0.9);
    printf("Synthetic moral psychology relevance score: %.3f\n", score);
    return 0;
}
