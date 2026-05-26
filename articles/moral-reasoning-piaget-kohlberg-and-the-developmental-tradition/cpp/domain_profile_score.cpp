/*
Synthetic developmental domain-profile score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/domain_profile_score.cpp -o outputs/tables/domain_profile_score_cpp
Run:
  ./outputs/tables/domain_profile_score_cpp
*/

#include <iostream>

int main() {
    double latentReasoning = 1.2;
    double perspectiveTaking = 0.7;
    double domainDifferentiation = 0.8;
    double relationalOrientation = 0.6;
    double normExposure = 0.4;
    double authorityOrientation = 0.3;

    double justiceReasoning =
        0.60 * latentReasoning +
        0.25 * perspectiveTaking +
        0.20 * domainDifferentiation;

    double careReasoning =
        0.35 * latentReasoning +
        0.50 * relationalOrientation +
        0.20 * perspectiveTaking;

    double conventionalSensitivity =
        0.25 * latentReasoning +
        0.45 * normExposure +
        0.35 * authorityOrientation -
        0.25 * domainDifferentiation;

    std::cout << "Synthetic justice reasoning: "
              << justiceReasoning << std::endl;
    std::cout << "Synthetic care reasoning: "
              << careReasoning << std::endl;
    std::cout << "Synthetic conventional sensitivity: "
              << conventionalSensitivity << std::endl;

    return 0;
}
