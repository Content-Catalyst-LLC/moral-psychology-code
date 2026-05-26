/*
Synthetic polarization distance example.
Educational scaffold only.

Compile:
  cc c/polarization_distance.c -lm -o outputs/tables/polarization_distance_c
Run:
  ./outputs/tables/polarization_distance_c
*/

#include <math.h>
#include <stdio.h>

double polarization_distance(double group_a_mean, double group_b_mean) {
    return fabs(group_a_mean - group_b_mean);
}

int main(void) {
    double group_a_mean = 0.72;
    double group_b_mean = -0.38;

    double distance = polarization_distance(group_a_mean, group_b_mean);

    printf("Synthetic polarization distance: %.3f\n", distance);
    return 0;
}
