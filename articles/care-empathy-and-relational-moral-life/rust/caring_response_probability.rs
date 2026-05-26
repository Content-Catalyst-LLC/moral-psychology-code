// Synthetic care, empathy, and relational moral life probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/caring_response_probability.rs -o outputs/tables/caring_response_probability_rust
// Run:
//   ./outputs/tables/caring_response_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let empathy = 0.8_f64;
    let felt_responsibility = 0.7_f64;
    let perceived_dependence = 0.6_f64;
    let temporal_persistence = 0.5_f64;
    let burnout = 0.4_f64;
    let institutional_support = 0.6_f64;
    let voice_safety = 0.5_f64;

    let latent =
        0.35 * empathy
        + 0.40 * felt_responsibility
        + 0.35 * perceived_dependence
        + 0.30 * temporal_persistence
        - 0.40 * burnout
        + 0.25 * institutional_support
        + 0.18 * voice_safety;

    let probability = logistic(latent);

    println!("Synthetic caring response probability: {:.3}", probability);
}
