/*
Synthetic relevance score example for "Why Moral Psychology Matters Today".
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/relevance_score.cpp -o outputs/tables/relevance_score_cpp
Run:
  ./outputs/tables/relevance_score_cpp
*/

#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, double> x = {
        {"political_polarization", 1.2},
        {"organizational_risk", 0.8},
        {"developmental_moral_learning", 0.4},
        {"cross_cultural_variation", 0.5},
        {"technology_amplification", 1.0},
        {"moral_injury_burden", 0.9}
    };

    std::map<std::string, double> w = {
        {"political_polarization", 0.25},
        {"organizational_risk", 0.20},
        {"developmental_moral_learning", 0.15},
        {"cross_cultural_variation", 0.15},
        {"technology_amplification", 0.15},
        {"moral_injury_burden", 0.20}
    };

    double score = 0.0;
    for (const auto& item : x) {
        score += item.second * w[item.first];
    }

    std::cout << "Synthetic moral psychology relevance score: "
              << score << std::endl;

    return 0;
}
