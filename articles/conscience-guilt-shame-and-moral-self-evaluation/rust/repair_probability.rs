// Synthetic repair probability from guilt, shame, empathy, and repair pathway.
// Educational scaffold only.
//
// Compile:
//   rustc rust/repair_probability.rs -o outputs/tables/repair_probability_rust
// Run:
//   ./outputs/tables/repair_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let guilt = 0.8_f64;
    let shame = 0.4_f64;
    let empathic_acknowledgment = 0.7_f64;
    let repair_pathway = 0.6_f64;
    let agency_capacity = 0.6_f64;
    let defensiveness = 0.2_f64;

    let latent =
        0.50 * guilt
        - 0.30 * shame
        + 0.35 * empathic_acknowledgment
        + 0.30 * repair_pathway
        + 0.20 * agency_capacity
        - 0.25 * defensiveness;

    let probability = logistic(latent);

    println!("Synthetic repair probability: {:.3}", probability);
}
