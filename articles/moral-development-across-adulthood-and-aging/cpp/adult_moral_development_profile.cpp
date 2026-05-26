/*
Synthetic adult moral-development profile example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/adult_moral_development_profile.cpp -o outputs/tables/adult_moral_development_profile_cpp
Run:
  ./outputs/tables/adult_moral_development_profile_cpp
*/

#include <iostream>

int main() {
    double age = 62.0;
    double moralIdentity = 0.7;
    double prosocialOrientation = 0.8;
    double roleComplexity = 0.5;
    double moralEmotionProfile = 0.6;
    double decisionCapacity = 0.4;
    double generativity = 0.9;
    double caregivingBurden = 0.3;
    double lossReflection = 0.6;

    double profile =
        0.03 * age -
        0.00025 * age * age +
        0.35 * moralIdentity +
        0.40 * prosocialOrientation +
        0.30 * roleComplexity +
        0.25 * moralEmotionProfile +
        0.20 * decisionCapacity +
        0.25 * generativity -
        0.20 * caregivingBurden +
        0.15 * lossReflection;

    std::cout << "Synthetic adult moral-development profile: "
              << profile << std::endl;

    return 0;
}
