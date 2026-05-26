/*
Synthetic conscience activation score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/conscience_activation_score.cpp -o outputs/tables/conscience_activation_score_cpp
Run:
  ./outputs/tables/conscience_activation_score_cpp
*/

#include <iostream>

int main() {
    double guilt = 0.8;
    double shame = 0.4;
    double normInternalization = 0.7;
    double perceivedResponsibility = 0.6;

    double conscienceActivation =
        0.40 * guilt +
        0.35 * shame +
        0.25 * normInternalization +
        0.20 * perceivedResponsibility;

    std::cout << "Synthetic conscience activation score: "
              << conscienceActivation << std::endl;

    return 0;
}
