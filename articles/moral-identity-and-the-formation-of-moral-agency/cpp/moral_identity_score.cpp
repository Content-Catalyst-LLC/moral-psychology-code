/*
Synthetic moral identity score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_identity_score.cpp -o outputs/tables/moral_identity_score_cpp
Run:
  ./outputs/tables/moral_identity_score_cpp
*/

#include <iostream>

int main() {
    double internalization = 0.9;
    double symbolization = 0.4;
    double narrativeIntegration = 0.7;
    double normIntegration = 0.6;

    double moralIdentity =
        0.50 * internalization +
        0.22 * symbolization +
        0.35 * narrativeIntegration +
        0.30 * normIntegration;

    std::cout << "Synthetic moral identity score: "
              << moralIdentity << std::endl;

    return 0;
}
