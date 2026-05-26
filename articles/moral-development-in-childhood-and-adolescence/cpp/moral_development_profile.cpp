/*
Synthetic childhood/adolescence moral-development profile example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_development_profile.cpp -o outputs/tables/moral_development_profile_cpp
Run:
  ./outputs/tables/moral_development_profile_cpp
*/

#include <iostream>

int main() {
    double age = 14.0;
    double perspectiveTaking = 0.7;
    double empathicConcern = 0.8;
    double normUnderstanding = 0.6;
    double peerContext = 0.4;
    double familySupport = 0.5;
    double schoolClimate = 0.5;
    double peerStatusPressure = 0.6;

    double profile =
        0.12 * age -
        0.002 * age * age +
        0.40 * perspectiveTaking +
        0.35 * empathicConcern +
        0.38 * normUnderstanding +
        0.20 * peerContext +
        0.25 * familySupport +
        0.20 * schoolClimate -
        0.20 * peerStatusPressure;

    std::cout << "Synthetic childhood/adolescence moral-development profile: "
              << profile << std::endl;

    return 0;
}
