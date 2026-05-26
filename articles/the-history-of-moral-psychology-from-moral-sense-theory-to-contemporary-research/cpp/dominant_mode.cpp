/*
Synthetic dominant explanatory mode example.
Educational scaffold only.

Compile:
  c++ -std=c++17 cpp/dominant_mode.cpp -o outputs/tables/dominant_mode_cpp
Run:
  ./outputs/tables/dominant_mode_cpp
*/

#include <iostream>
#include <map>
#include <string>

int main() {
    std::map<std::string, double> modes = {
        {"sentiment", 0.45},
        {"reason", 0.40},
        {"development", 0.45},
        {"intuition", 0.75},
        {"culture_politics", 0.85},
        {"neuroscience_experiment", 0.80},
        {"institutions", 0.90}
    };

    std::string dominant = "";
    double maxValue = -1.0;

    for (const auto& item : modes) {
        if (item.second > maxValue) {
            dominant = item.first;
            maxValue = item.second;
        }
    }

    std::cout << "Synthetic dominant mode: " << dominant
              << " (" << maxValue << ")" << std::endl;

    return 0;
}
