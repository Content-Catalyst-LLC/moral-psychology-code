/*
Synthetic person-situation moral action score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/person_situation_score.cpp -o outputs/tables/person_situation_score_cpp
Run:
  ./outputs/tables/person_situation_score_cpp
*/

#include <iostream>

int main() {
    double characterStrength = 0.8;
    double selfRegulation = 0.6;
    double habitStrength = 0.7;
    double moralIdentity = 0.5;
    double situationalPressure = 0.9;
    double voiceSafety = 0.4;
    double accountabilityVisibility = 0.5;
    double depletion = 0.3;

    double score =
        0.42 * characterStrength +
        0.28 * selfRegulation +
        0.25 * habitStrength +
        0.22 * moralIdentity -
        0.55 * situationalPressure +
        0.25 * voiceSafety +
        0.25 * accountabilityVisibility -
        0.20 * depletion -
        0.22 * characterStrength * situationalPressure;

    std::cout << "Synthetic person-situation moral action score: "
              << score << std::endl;

    return 0;
}
