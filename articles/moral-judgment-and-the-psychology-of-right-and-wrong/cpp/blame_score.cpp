/*
Synthetic moral blame score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/blame_score.cpp -o outputs/tables/blame_score_cpp
Run:
  ./outputs/tables/blame_score_cpp
*/

#include <iostream>

int main() {
    double wrongnessRating = 5.2;
    double perceivedAgency = 0.8;
    double repairOpportunity = 0.3;
    double emotionalActivation = 0.5;
    double situationalAmbiguity = 0.2;

    double blameScore =
        0.60 * wrongnessRating +
        0.45 * perceivedAgency -
        0.35 * repairOpportunity +
        0.15 * emotionalActivation -
        0.15 * situationalAmbiguity;

    std::cout << "Synthetic blame score: "
              << blameScore << std::endl;

    return 0;
}
