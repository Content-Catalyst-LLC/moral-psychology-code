// Synthetic moral identity action probability example.
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
    let moral_judgment = 0.7_f64;
    let moral_identity = 0.9_f64;
    let self_regulatory_capacity = 0.6_f64;
    let situational_pressure = 0.5_f64;

    let latent =
        0.35 * moral_judgment
        + 0.45 * moral_identity
        + 0.30 * self_regulatory_capacity
        - 0.40 * situational_pressure;

    let probability = logistic(latent);

    println!("Synthetic moral action probability: {:.3}", probability);
}
