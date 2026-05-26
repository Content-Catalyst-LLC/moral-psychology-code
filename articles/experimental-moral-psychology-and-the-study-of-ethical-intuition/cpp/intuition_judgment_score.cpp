/*
Synthetic moral judgment score example for Experimental Moral Psychology.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/intuition_judgment_score.cpp -o outputs/tables/intuition_judgment_score_cpp
Run:
  ./outputs/tables/intuition_judgment_score_cpp
*/

#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, double> indicators = {
        {"intuition", 0.8},
        {"reflection", 0.4},
        {"norm_sensitivity", 0.7},
        {"consequence_sensitivity", 0.6}
    };

    std::map<std::string, double> weights = {
        {"intuition", 0.30},
        {"reflection", 0.20},
        {"norm_sensitivity", 0.25},
        {"consequence_sensitivity", 0.25}
    };

    double score = 0.0;
    for (const auto& item : indicators) {
        score += item.second * weights[item.first];
    }

    std::cout << "Synthetic moral judgment score: "
              << score << std::endl;

    return 0;
}
