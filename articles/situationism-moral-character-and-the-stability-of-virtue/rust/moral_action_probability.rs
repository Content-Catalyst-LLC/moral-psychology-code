// Synthetic situationism moral action probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/moral_action_probability.rs -o outputs/tables/moral_action_probability_rust
// Run:
//   ./outputs/tables/moral_action_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let character_strength = 0.8_f64;
    let habit_strength = 0.6_f64;
    let situational_pressure = 0.7_f64;
    let voice_safety = 0.4_f64;
    let accountability_visibility = 0.5_f64;
    let depletion = 0.3_f64;

    let latent =
        0.42 * character_strength
        + 0.25 * habit_strength
        - 0.55 * situational_pressure
        + 0.25 * voice_safety
        + 0.25 * accountability_visibility
        - 0.20 * depletion
        - 0.22 * character_strength * situational_pressure;

    let probability = logistic(latent);

    println!("Synthetic moral action probability: {:.3}", probability);
}
