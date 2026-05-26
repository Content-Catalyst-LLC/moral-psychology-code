/*
Synthetic inequity-aversion score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/inequity_aversion_score.cpp -o outputs/tables/inequity_aversion_score_cpp
Run:
  ./outputs/tables/inequity_aversion_score_cpp
*/

#include <cmath>
#include <iostream>

int main() {
    double equality_weight = -0.8;
    double need_weight = 0.7;
    double self_interest_bias = 0.3;

    double inequity_aversion =
        0.45 * std::abs(equality_weight) +
        0.30 * need_weight -
        0.25 * self_interest_bias;

    std::cout << "Synthetic inequity-aversion score: "
              << inequity_aversion << std::endl;

    return 0;
}
