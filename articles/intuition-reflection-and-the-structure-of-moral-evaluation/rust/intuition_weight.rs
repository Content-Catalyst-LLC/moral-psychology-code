// Synthetic intuition-weight calculation.
// Educational scaffold only.
//
// Compile:
//   rustc rust/intuition_weight.rs -o outputs/tables/intuition_weight_rust
// Run:
//   ./outputs/tables/intuition_weight_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let affective_activation = 0.7_f64;
    let social_salience = 0.5_f64;
    let group_identity_pressure = 0.6_f64;
    let evidential_reconsideration = 0.4_f64;
    let time_for_reflection = 0.8_f64;

    let latent =
        0.30
        + 0.35 * affective_activation
        + 0.25 * social_salience
        + 0.20 * group_identity_pressure
        - 0.30 * evidential_reconsideration
        - 0.25 * time_for_reflection;

    let intuition_weight = logistic(latent);

    println!("Synthetic intuition weight: {:.3}", intuition_weight);
}
