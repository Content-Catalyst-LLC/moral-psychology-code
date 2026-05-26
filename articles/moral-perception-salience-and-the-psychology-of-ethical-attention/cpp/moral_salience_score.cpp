/*
Synthetic moral salience score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_salience_score.cpp -o outputs/tables/moral_salience_score_cpp
Run:
  ./outputs/tables/moral_salience_score_cpp
*/

#include <iostream>

int main() {
    double perceivedHarm = 0.8;
    double visibleVulnerability = 0.7;
    double emotionalActivation = 0.4;
    double mindPerception = 0.8;
    double contextualFraming = 0.5;
    double attentionalCompetition = 0.3;
    double organizedInattention = 0.4;

    double latentSalience =
        0.60 * perceivedHarm +
        0.50 * visibleVulnerability +
        0.35 * emotionalActivation +
        0.40 * mindPerception +
        0.25 * contextualFraming -
        0.45 * attentionalCompetition -
        0.35 * organizedInattention;

    std::cout << "Synthetic latent moral salience score: "
              << latentSalience << std::endl;

    return 0;
}
