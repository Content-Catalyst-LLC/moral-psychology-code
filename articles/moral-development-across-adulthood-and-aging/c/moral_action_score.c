#include <stdio.h>

// Toy moral-action score.
// Educational only.
// Compile with: cc c/moral_action_score.c -o outputs/moral_action_score

double moral_action_score(double identity, double perception, double regulation, double norm_support, double temptation) {
    return 0.24 * identity + 0.22 * perception + 0.22 * regulation + 0.18 * norm_support - 0.25 * temptation;
}

int main(void) {
    double score = moral_action_score(0.75, 0.70, 0.66, 0.60, 0.35);
    printf("Moral-action score: %.3f\n", score);
    return 0;
}
