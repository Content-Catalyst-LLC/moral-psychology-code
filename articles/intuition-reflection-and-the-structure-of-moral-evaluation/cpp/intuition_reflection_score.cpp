/*
Synthetic intuition-reflection score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/intuition_reflection_score.cpp -o outputs/tables/intuition_reflection_score_cpp
Run:
  ./outputs/tables/intuition_reflection_score_cpp
*/

#include <iostream>

int main() {
    double perceivedHarm = 0.9;
    double affectiveActivation = 0.7;
    double socialSalience = 0.5;
    double principledReasoning = 0.8;
    double evidentialReconsideration = 0.6;
    double contextualKnowledge = 0.7;
    double intuitionWeight = 0.55;

    double intuitiveAppraisal =
        0.55 * perceivedHarm +
        0.45 * affectiveActivation +
        0.30 * socialSalience;

    double reflectiveEvaluation =
        0.40 * principledReasoning +
        0.35 * evidentialReconsideration +
        0.30 * contextualKnowledge;

    double finalMoralEvaluation =
        intuitionWeight * intuitiveAppraisal +
        (1.0 - intuitionWeight) * reflectiveEvaluation;

    std::cout << "Synthetic intuitive appraisal: "
              << intuitiveAppraisal << std::endl;
    std::cout << "Synthetic reflective evaluation: "
              << reflectiveEvaluation << std::endl;
    std::cout << "Synthetic final moral evaluation: "
              << finalMoralEvaluation << std::endl;

    return 0;
}
