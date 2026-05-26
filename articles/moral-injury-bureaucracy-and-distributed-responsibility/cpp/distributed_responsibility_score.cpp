/*
Synthetic distributed responsibility score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/distributed_responsibility_score.cpp -o outputs/tables/distributed_responsibility_score_cpp
Run:
  ./outputs/tables/distributed_responsibility_score_cpp
*/

#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<double> weights = {0.10, 0.15, 0.12, 0.18, 0.09, 0.11, 0.13, 0.12};

    double total = std::accumulate(weights.begin(), weights.end(), 0.0);
    for (double& w : weights) {
        w = w / total;
    }

    double max_weight = *std::max_element(weights.begin(), weights.end());
    double distributed_responsibility = 1.0 - max_weight;

    std::cout << "Synthetic distributed responsibility pressure: "
              << distributed_responsibility << std::endl;

    return 0;
}
