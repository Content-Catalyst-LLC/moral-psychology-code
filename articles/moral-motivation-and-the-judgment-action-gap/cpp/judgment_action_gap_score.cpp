/*
Synthetic judgment-action gap score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/judgment_action_gap_score.cpp -o outputs/tables/judgment_action_gap_score_cpp
Run:
  ./outputs/tables/judgment_action_gap_score_cpp
*/

#include <iostream>

int main() {
    double moralJudgment = 0.9;
    double moralAction = 0.0;

    double judgmentActionGap = moralJudgment - moralAction;

    std::cout << "Synthetic judgment-action gap score: "
              << judgmentActionGap << std::endl;

    return 0;
}
