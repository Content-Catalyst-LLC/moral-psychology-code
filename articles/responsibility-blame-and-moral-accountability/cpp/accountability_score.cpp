/*
Synthetic accountability score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/accountability_score.cpp -o outputs/tables/accountability_score_cpp
Run:
  ./outputs/tables/accountability_score_cpp
*/

#include <iostream>

int main() {
    double responsibility = 0.8;
    double institutional_structure = 0.6;
    double wrongness_severity = 0.7;
    double repair_capacity = 0.5;
    double prevention_capacity = 0.4;

    double accountability =
        0.45 * responsibility +
        0.25 * institutional_structure +
        0.20 * wrongness_severity +
        0.20 * repair_capacity +
        0.15 * prevention_capacity;

    std::cout << "Synthetic accountability score: " << accountability << std::endl;
    return 0;
}
