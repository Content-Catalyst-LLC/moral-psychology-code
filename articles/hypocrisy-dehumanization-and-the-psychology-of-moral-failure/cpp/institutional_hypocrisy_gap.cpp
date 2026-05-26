/*
Synthetic institutional hypocrisy gap example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/institutional_hypocrisy_gap.cpp -o outputs/tables/institutional_hypocrisy_gap_cpp
Run:
  ./outputs/tables/institutional_hypocrisy_gap_cpp
*/

#include <iostream>

int main() {
    double public_value_claim = 0.9;
    double actual_practice_integrity = 0.4;

    double institutional_hypocrisy = public_value_claim - actual_practice_integrity;

    std::cout << "Synthetic institutional hypocrisy gap: "
              << institutional_hypocrisy << std::endl;

    return 0;
}
