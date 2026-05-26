// Synthetic moral failure probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/moral_failure_probability.rs -o outputs/tables/moral_failure_probability_rust
// Run:
//   ./outputs/tables/moral_failure_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let hypocrisy = 0.8_f64;
    let dehumanization = 0.7_f64;
    let ingroup_bias = 0.5_f64;
    let institutional_hypocrisy = 0.6_f64;
    let empathic_recognition = 0.3_f64;
    let accountability_strength = 0.4_f64;
    let victim_visibility = 0.2_f64;

    let latent =
        0.45 * hypocrisy
        + 0.40 * dehumanization
        + 0.30 * ingroup_bias
        + 0.25 * institutional_hypocrisy
        - 0.35 * empathic_recognition
        - 0.25 * accountability_strength
        - 0.20 * victim_visibility;

    let probability = logistic(latent);

    println!("Synthetic moral failure probability: {:.3}", probability);
}
