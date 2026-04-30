#include <iostream>

// Toy moral-agency score.
// Educational only.
// Compile with: g++ cpp/moral_agency_score.cpp -o outputs/moral_agency_score

int main() {
    double moral_perception = 0.72;
    double moral_judgment = 0.70;
    double moral_emotion = 0.62;
    double moral_identity = 0.68;
    double self_regulation = 0.64;
    double reparative_orientation = 0.58;
    double failure_dynamics = 0.32;

    double moral_agency =
        0.13 * moral_perception +
        0.13 * moral_judgment +
        0.12 * moral_emotion +
        0.14 * moral_identity +
        0.14 * self_regulation +
        0.12 * reparative_orientation -
        0.16 * failure_dynamics;

    std::cout << "Moral agency score: " << moral_agency << "\n";
    return 0;
}
