// Synthetic wrongness probability.
// Educational scaffold only.
//
// Compile:
//   rustc rust/wrongness_probability.rs -o outputs/tables/wrongness_probability_rust
// Run:
//   ./outputs/tables/wrongness_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let perceived_harm = 0.8_f64;
    let norm_violation = 0.7_f64;
    let inferred_intention = 0.6_f64;
    let emotional_activation = 0.4_f64;
    let ideological_framing = 0.2_f64;
    let situational_ambiguity = 0.3_f64;

    let latent_wrongness =
        0.65 * perceived_harm
        + 0.55 * norm_violation
        + 0.50 * inferred_intention
        + 0.25 * emotional_activation
        + 0.20 * ideological_framing
        - 0.30 * situational_ambiguity;

    let probability = logistic(latent_wrongness);

    println!("Synthetic wrongness probability: {:.3}", probability);
}
