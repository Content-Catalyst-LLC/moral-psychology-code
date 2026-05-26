// Synthetic helping probability from differentiated moral emotions.
// Educational scaffold only.
//
// Compile:
//   rustc rust/helping_probability.rs -o outputs/tables/helping_probability_rust
// Run:
//   ./outputs/tables/helping_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let guilt = 0.7_f64;
    let compassion = 0.8_f64;
    let elevation = 0.6_f64;
    let shame = 0.3_f64;
    let disgust = 0.2_f64;
    let repair_pathway = 0.6_f64;

    let latent =
        0.35 * guilt
        + 0.45 * compassion
        + 0.30 * elevation
        - 0.20 * shame
        - 0.15 * disgust
        + 0.20 * repair_pathway;

    let probability = logistic(latent);

    println!("Synthetic helping probability: {:.3}", probability);
}
