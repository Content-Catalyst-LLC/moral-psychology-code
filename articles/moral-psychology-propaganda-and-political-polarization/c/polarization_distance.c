/*
Synthetic polarization distance example.
Educational scaffold only.

Compile:
  cc c/polarization_distance.c -o outputs/tables/polarization_distance_c
Run:
  ./outputs/tables/polarization_distance_c
*/

#include <math.h>
#include <stdio.h>

double polarization_distance(double mean_group_a, double mean_group_b) {
    return fabs(mean_group_a - mean_group_b);
}

int main(void) {
    double distance = polarization_distance(0.75, -0.45);
    printf("Synthetic polarization distance: %.3f\n", distance);
    return 0;
}
