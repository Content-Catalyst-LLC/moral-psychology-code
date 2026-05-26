// Synthetic unethical action probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/unethical_action_probability.rs -o outputs/tables/unethical_action_probability_rust
// Run:
//   ./outputs/tables/unethical_action_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let moral_disengagement = 0.8_f64;
    let anticipated_guilt = 0.3_f64;
    let institutional_pressure = 0.6_f64;
    let accountability_strength = 0.4_f64;

    let latent =
        0.55 * moral_disengagement
        - 0.35 * anticipated_guilt
        + 0.30 * institutional_pressure
        - 0.25 * accountability_strength;

    let probability = logistic(latent);

    println!("Synthetic unethical action probability: {:.3}", probability);
}
