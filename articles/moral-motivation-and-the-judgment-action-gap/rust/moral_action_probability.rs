// Synthetic moral action probability under judgment and pressure.
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
    let moral_judgment = 0.8_f64;
    let emotional_activation = 0.6_f64;
    let moral_identity = 0.7_f64;
    let self_regulation = 0.6_f64;
    let situational_pressure = 0.5_f64;
    let rationalization_tendency = 0.3_f64;

    let latent =
        0.45 * moral_judgment
        + 0.30 * emotional_activation
        + 0.35 * moral_identity
        + 0.40 * self_regulation
        - 0.50 * situational_pressure
        - 0.25 * rationalization_tendency;

    let probability = logistic(latent);

    println!("Synthetic moral action probability: {:.3}", probability);
}
