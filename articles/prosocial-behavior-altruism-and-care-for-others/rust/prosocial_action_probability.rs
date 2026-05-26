// Synthetic prosocial action probability example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/prosocial_action_probability.rs -o outputs/tables/prosocial_action_probability_rust
// Run:
//   ./outputs/tables/prosocial_action_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let empathic_concern = 0.8_f64;
    let norm_strength = 0.6_f64;
    let relational_closeness = 0.5_f64;
    let visible_vulnerability = 0.7_f64;
    let perceived_cost = 0.4_f64;
    let institutional_support = 0.5_f64;

    let latent =
        0.40 * empathic_concern
        + 0.30 * norm_strength
        + 0.25 * relational_closeness
        + 0.30 * visible_vulnerability
        - 0.35 * perceived_cost
        + 0.18 * institutional_support;

    let probability = logistic(latent);

    println!("Synthetic prosocial action probability: {:.3}", probability);
}
