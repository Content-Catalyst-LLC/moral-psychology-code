// Synthetic blame probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/blame_probability.rs -o outputs/tables/blame_probability_rust
// Run:
//   ./outputs/tables/blame_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let responsibility = 0.8_f64;
    let wrongness_severity = 0.7_f64;
    let motive_malice = 0.5_f64;
    let mitigating_excuse = 0.4_f64;

    let latent =
        0.40 * responsibility
        + 0.35 * wrongness_severity
        + 0.25 * motive_malice
        - 0.30 * mitigating_excuse;

    let probability = logistic(latent);

    println!("Synthetic blame probability: {:.3}", probability);
}
