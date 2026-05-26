/*
Synthetic judgment-action gap example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/judgment_action_gap.cpp -o outputs/tables/judgment_action_gap_cpp
Run:
  ./outputs/tables/judgment_action_gap_cpp
*/

#include <iostream>

int main() {
    double moralJudgment = 0.82;
    double moralAction = 0.54;

    double gap = moralJudgment - moralAction;

    std::cout << "Synthetic judgment-action gap: "
              << gap << std::endl;

    return 0;
}
