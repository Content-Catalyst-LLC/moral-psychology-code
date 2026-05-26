/*
Synthetic perceived norm extremity score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/norm_extremity_score.cpp -o outputs/tables/norm_extremity_score_cpp
Run:
  ./outputs/tables/norm_extremity_score_cpp
*/

#include <iostream>

int main() {
    double visibility_bias = 0.8;
    double algorithmic_amplification = 0.7;
    double outrage_expression = 1.0;
    double cross_group_exposure = 0.4;

    double norm_extremity =
        0.40 * visibility_bias +
        0.25 * algorithmic_amplification +
        0.20 * outrage_expression -
        0.15 * cross_group_exposure;

    std::cout << "Synthetic perceived norm extremity: "
              << norm_extremity << std::endl;

    return 0;
}
