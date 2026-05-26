/*
Synthetic final moral evaluation from intuitive and reflective components.
Educational scaffold only.

Compile:
  cc c/final_moral_evaluation.c -lm -o outputs/tables/final_moral_evaluation_c
Run:
  ./outputs/tables/final_moral_evaluation_c
*/

#include <stdio.h>

int main(void) {
    double intuitive_appraisal = 0.85;
    double reflective_evaluation = 0.35;
    double intuition_weight = 0.60;

    double final_moral_evaluation =
        intuition_weight * intuitive_appraisal +
        (1.0 - intuition_weight) * reflective_evaluation;

    double reflective_revision = reflective_evaluation - intuitive_appraisal;

    printf("Synthetic final moral evaluation: %.3f\n", final_moral_evaluation);
    printf("Synthetic reflective revision: %.3f\n", reflective_revision);

    return 0;
}
