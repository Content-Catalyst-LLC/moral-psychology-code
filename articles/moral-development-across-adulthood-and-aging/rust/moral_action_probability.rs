// Synthetic adult moral action probability example.
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
    let latent_moral_development = 0.8_f64;
    let voice_safety = 0.5_f64;
    let accountability_strength = 0.7_f64;
    let caregiving_burden = 0.4_f64;

    let latent =
        0.45 * latent_moral_development
        + 0.25 * voice_safety
        + 0.25 * accountability_strength
        - 0.25 * caregiving_burden;

    let probability = logistic(latent);

    println!("Synthetic adult moral action probability: {:.3}", probability);
}
