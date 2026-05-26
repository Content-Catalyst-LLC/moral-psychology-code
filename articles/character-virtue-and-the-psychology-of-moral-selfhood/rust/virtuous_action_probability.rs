// Synthetic character, virtue, and moral selfhood probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/virtuous_action_probability.rs -o outputs/tables/virtuous_action_probability_rust
// Run:
//   ./outputs/tables/virtuous_action_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let character_strength = 0.8_f64;
    let moral_selfhood_profile = 0.7_f64;
    let situational_pressure = 0.6_f64;
    let institutional_support = 0.5_f64;
    let self_regulation = 0.6_f64;

    let latent =
        0.45 * character_strength
        + 0.30 * moral_selfhood_profile
        - 0.40 * situational_pressure
        + 0.25 * institutional_support
        + 0.20 * self_regulation;

    let probability = logistic(latent);

    println!("Synthetic virtuous action probability: {:.3}", probability);
}
