/*
Synthetic moral disengagement score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_disengagement_score.cpp -o outputs/tables/moral_disengagement_score_cpp
Run:
  ./outputs/tables/moral_disengagement_score_cpp
*/

#include <iostream>

int main() {
    double moralJustification = 0.7;
    double euphemisticLanguage = 0.6;
    double advantageousComparison = 0.5;
    double responsibilityShifting = 0.8;
    double consequenceDistortion = 0.6;
    double dehumanization = 0.4;
    double victimBlaming = 0.3;
    double consequenceVisibility = 0.2;
    double victimRecognition = 0.2;

    double moralDisengagement =
        0.30 * moralJustification +
        0.25 * euphemisticLanguage +
        0.20 * advantageousComparison +
        0.30 * responsibilityShifting +
        0.25 * consequenceDistortion +
        0.25 * dehumanization +
        0.20 * victimBlaming -
        0.20 * consequenceVisibility -
        0.20 * victimRecognition;

    std::cout << "Synthetic moral disengagement score: "
              << moralDisengagement << std::endl;

    return 0;
}
