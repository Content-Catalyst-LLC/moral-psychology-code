/*
Synthetic weakness-of-will score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/weakness_of_will_score.cpp -o outputs/tables/weakness_of_will_score_cpp
Run:
  ./outputs/tables/weakness_of_will_score_cpp
*/

#include <iostream>

int main() {
    double moralJudgment = 0.9;
    double moralAction = 0.0;

    double weaknessOfWill = moralJudgment - moralAction;

    std::cout << "Synthetic weakness-of-will score: "
              << weaknessOfWill << std::endl;

    return 0;
}
