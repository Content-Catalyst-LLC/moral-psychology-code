/*
Synthetic moral response profile example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_response_profile.cpp -o outputs/tables/moral_response_profile_cpp
Run:
  ./outputs/tables/moral_response_profile_cpp
*/

#include <iostream>

int main() {
    double broadPersonality = 0.4;
    double characterStrength = 0.8;
    double moralIdentity = 0.7;
    double empathy = 0.6;
    double selfRegulation = 0.5;
    double humility = 0.4;
    double selfInterestBias = 0.3;

    double profile =
        0.20 * broadPersonality +
        0.30 * characterStrength +
        0.35 * moralIdentity +
        0.25 * empathy +
        0.20 * selfRegulation +
        0.15 * humility -
        0.35 * selfInterestBias;

    std::cout << "Synthetic moral response profile: "
              << profile << std::endl;

    return 0;
}
