/*
Synthetic cultural moral-profile distance example.
Educational scaffold only.

Compile:
  cc c/cultural_profile_distance.c -lm -o outputs/tables/cultural_profile_distance_c
Run:
  ./outputs/tables/cultural_profile_distance_c
*/

#include <math.h>
#include <stdio.h>

double euclidean_distance(const double a[], const double b[], int n) {
    double total = 0.0;

    for (int i = 0; i < n; i++) {
        double diff = a[i] - b[i];
        total += diff * diff;
    }

    return sqrt(total);
}

int main(void) {
    double context_a[] = {0.45, 0.30, 0.10, 0.10, 0.05, 0.10};
    double context_b[] = {0.25, 0.20, 0.30, 0.25, 0.20, 0.25};

    double distance = euclidean_distance(context_a, context_b, 6);

    printf("Synthetic cultural moral-profile distance: %.3f\n", distance);
    return 0;
}
