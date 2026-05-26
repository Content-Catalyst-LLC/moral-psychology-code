/*
Synthetic pluralist value-gap example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/pluralist_value_gap.cpp -o outputs/tables/pluralist_value_gap_cpp
Run:
  ./outputs/tables/pluralist_value_gap_cpp
*/

#include <cmath>
#include <iostream>
#include <vector>

double value_gap(const std::vector<double>& a, const std::vector<double>& b) {
    double total = 0.0;

    for (size_t i = 0; i < a.size(); ++i) {
        total += std::abs(a[i] - b[i]);
    }

    return total;
}

int main() {
    std::vector<double> person_a = {0.8, 0.7, 0.2, 0.1, 0.2, 0.8};
    std::vector<double> person_b = {0.3, 0.4, 0.8, 0.7, 0.6, 0.4};

    std::cout << "Synthetic pluralist value gap: "
              << value_gap(person_a, person_b) << std::endl;

    return 0;
}
