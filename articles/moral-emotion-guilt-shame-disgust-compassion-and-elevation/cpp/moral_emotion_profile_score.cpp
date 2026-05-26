/*
Synthetic moral-emotion profile score example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/moral_emotion_profile_score.cpp -o outputs/tables/moral_emotion_profile_score_cpp
Run:
  ./outputs/tables/moral_emotion_profile_score_cpp
*/

#include <iostream>

int main() {
    double guilt = 0.7;
    double compassion = 0.8;
    double elevation = 0.6;
    double shame = 0.3;
    double disgust = 0.2;

    double constructiveEmotionIndex = (guilt + compassion + elevation) / 3.0;
    double punitiveEmotionIndex = (shame + disgust) / 2.0;

    std::cout << "Synthetic constructive emotion index: "
              << constructiveEmotionIndex << std::endl;
    std::cout << "Synthetic punitive emotion index: "
              << punitiveEmotionIndex << std::endl;

    return 0;
}
