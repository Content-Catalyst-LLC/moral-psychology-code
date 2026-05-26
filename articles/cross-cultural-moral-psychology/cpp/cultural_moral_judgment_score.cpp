/*
Synthetic culturally weighted moral judgment example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/cultural_moral_judgment_score.cpp -o outputs/tables/cultural_moral_judgment_score_cpp
Run:
  ./outputs/tables/cultural_moral_judgment_score_cpp
*/

#include <iostream>
#include <vector>

double dot_product(const std::vector<double>& weights, const std::vector<double>& values) {
    double total = 0.0;

    for (size_t i = 0; i < weights.size(); ++i) {
        total += weights[i] * values[i];
    }

    return total;
}

int main() {
    std::vector<double> context_weights = {0.30, 0.25, 0.25, 0.20, 0.15, 0.20};
    std::vector<double> moral_values = {0.8, 0.6, 0.5, 0.4, 0.2, 0.7};

    double judgment = dot_product(context_weights, moral_values);

    std::cout << "Synthetic culturally weighted moral judgment: "
              << judgment << std::endl;

    return 0;
}
