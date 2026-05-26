/*
Synthetic altruistic motive score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/altruistic_motive_score.cpp -o outputs/tables/altruistic_motive_score_cpp
Run:
  ./outputs/tables/altruistic_motive_score_cpp
*/

#include <iostream>

int main() {
    double otherOrientedDesire = 0.8;
    double selfOrientedPayoff = 0.3;
    double empathicConcern = 0.7;

    double altruisticMotive =
        0.55 * otherOrientedDesire -
        0.35 * selfOrientedPayoff +
        0.20 * empathicConcern;

    std::cout << "Synthetic altruistic motive score: "
              << altruisticMotive << std::endl;

    return 0;
}
