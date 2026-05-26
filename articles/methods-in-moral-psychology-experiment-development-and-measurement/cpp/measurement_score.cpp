/*
Synthetic measurement score example for Methods in Moral Psychology.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/measurement_score.cpp -o outputs/tables/measurement_score_cpp
Run:
  ./outputs/tables/measurement_score_cpp
*/

#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, double> indicators = {
        {"wrongness", 0.8},
        {"blame", 0.6},
        {"norm_learning", 0.7},
        {"action_tendency", 0.5}
    };

    std::map<std::string, double> weights = {
        {"wrongness", 0.35},
        {"blame", 0.30},
        {"norm_learning", 0.20},
        {"action_tendency", 0.15}
    };

    double score = 0.0;

    for (const auto& item : indicators) {
        score += item.second * weights[item.first];
    }

    std::cout << "Synthetic latent moral construct score: "
              << score << std::endl;

    return 0;
}
