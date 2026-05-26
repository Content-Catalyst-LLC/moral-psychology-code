/*
Synthetic moral exclusion score example.
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
    double propaganda = 0.8;
    double outrage = 0.7;
    double identity = 0.6;
    double democratic_trust = 0.4;
    double contact = 0.3;

    double latent =
        0.35 * threat +
        0.30 * propaganda +
        0.25 * outrage +
        0.20 * identity -
        0.25 * democratic_trust -
        0.20 * contact;

    double risk = logistic(latent);

    std::cout << "Synthetic moral exclusion risk: " << risk << std::endl;
    return 0;
}
