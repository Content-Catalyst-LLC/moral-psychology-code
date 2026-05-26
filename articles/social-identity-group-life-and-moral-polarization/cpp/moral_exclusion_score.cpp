/*
Synthetic moral exclusion risk example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_exclusion_score.cpp -o outputs/tables/moral_exclusion_score_cpp
Run:
  ./outputs/tables/moral_exclusion_score_cpp
*/

#include <cmath>
#include <iostream>

double logistic(double x) {
    return 1.0 / (1.0 + std::exp(-x));
}

int main() {
    double threat = 1.0;
    double dehumanizing_rhetoric = 0.8;
    double loyalty_pressure = 0.7;
    double identity_strength = 0.6;
    double institutional_trust = 0.4;
    double cross_group_contact = 0.3;

    double latent =
        0.35 * threat +
        0.30 * dehumanizing_rhetoric +
        0.25 * loyalty_pressure +
        0.20 * identity_strength -
        0.25 * institutional_trust -
        0.20 * cross_group_contact;

    double risk = logistic(latent);

    std::cout << "Synthetic moral exclusion risk: " << risk << std::endl;
    return 0;
}
