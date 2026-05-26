/*
Synthetic institutional integrity score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/institutional_integrity_score.cpp -o outputs/tables/institutional_integrity_score_cpp
Run:
  ./outputs/tables/institutional_integrity_score_cpp
*/

#include <iostream>

int main() {
    double accountability_strength = 0.8;
    double speak_up_protection = 0.7;
    double value_alignment = 0.9;
    double cultural_climate = 0.6;
    double corruption_pressure = 0.3;
    double diffusion_responsibility = 0.4;

    double integrity =
        0.30 * accountability_strength +
        0.30 * speak_up_protection +
        0.30 * value_alignment +
        0.20 * cultural_climate -
        0.30 * corruption_pressure -
        0.20 * diffusion_responsibility;

    std::cout << "Synthetic institutional integrity score: "
              << integrity << std::endl;

    return 0;
}
