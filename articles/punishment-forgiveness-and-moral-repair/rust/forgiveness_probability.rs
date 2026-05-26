// Synthetic forgiveness probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/forgiveness_probability.rs -o outputs/tables/forgiveness_probability_rust
// Run:
//   ./outputs/tables/forgiveness_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let acknowledgment = 0.8_f64;
    let amends = 0.7_f64;
    let ongoing_threat = 0.4_f64;
    let victim_recognition = 0.6_f64;

    let latent =
        0.35 * acknowledgment
        + 0.30 * amends
        - 0.40 * ongoing_threat
        + 0.15 * victim_recognition;

    let probability = logistic(latent);

    println!("Synthetic forgiveness probability: {:.3}", probability);
}
