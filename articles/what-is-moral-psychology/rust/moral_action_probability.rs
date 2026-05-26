// Synthetic moral action probability.
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
    let moral_salience = 0.7_f64;
    let moral_judgment = 0.8_f64;
    let moral_emotion = 0.5_f64;
    let moral_identity = 0.6_f64;
    let self_regulation = 0.8_f64;
    let institutional_pressure = 0.4_f64;

    let latent_action =
        0.25 * moral_salience
        + 0.30 * moral_judgment
        + 0.15 * moral_emotion
        + 0.20 * moral_identity
        + 0.20 * self_regulation
        - 0.25 * institutional_pressure;

    let probability = logistic(latent_action);

    println!("Synthetic moral action probability: {:.3}", probability);
}
