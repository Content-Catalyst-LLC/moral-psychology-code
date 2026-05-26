/*
Synthetic sustainable care score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/care_sustainability_score.cpp -o outputs/tables/care_sustainability_score_cpp
Run:
  ./outputs/tables/care_sustainability_score_cpp
*/

#include <iostream>

int main() {
    double humaneWorkload = 0.7;
    double voiceSafety = 0.6;
    double accountability = 0.5;
    double resources = 0.8;
    double overload = 0.4;

    double sustainableCare =
        0.30 * humaneWorkload +
        0.25 * voiceSafety +
        0.25 * accountability +
        0.30 * resources -
        0.35 * overload;

    std::cout << "Synthetic sustainable care score: "
              << sustainableCare << std::endl;

    return 0;
}
