/*
Synthetic moral selfhood score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_selfhood_score.cpp -o outputs/tables/moral_selfhood_score_cpp
Run:
  ./outputs/tables/moral_selfhood_score_cpp
*/

#include <iostream>

int main() {
    double characterStrength = 0.8;
    double identityIntegration = 0.7;
    double accountability = 0.6;
    double repairCapacity = 0.7;
    double selfRegulation = 0.6;

    double moralSelfhood =
        0.40 * characterStrength +
        0.30 * identityIntegration +
        0.25 * accountability +
        0.30 * repairCapacity +
        0.20 * selfRegulation;

    std::cout << "Synthetic moral selfhood score: "
              << moralSelfhood << std::endl;

    return 0;
}
