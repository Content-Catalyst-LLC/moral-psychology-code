// Synthetic childhood/adolescence moral action probability example.
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
    let empathic_concern = 0.6_f64;
    let school_climate = 0.5_f64;
    let peer_status_pressure = 0.7_f64;

    let latent =
        0.45 * latent_moral_development
        + 0.30 * empathic_concern
        + 0.25 * school_climate
        - 0.30 * peer_status_pressure;

    let probability = logistic(latent);

    println!("Synthetic moral action probability: {:.3}", probability);
}
