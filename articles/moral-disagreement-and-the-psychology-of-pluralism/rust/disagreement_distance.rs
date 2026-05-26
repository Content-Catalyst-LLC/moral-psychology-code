// Synthetic moral disagreement distance example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/disagreement_distance.rs -o outputs/tables/disagreement_distance_rust
// Run:
//   ./outputs/tables/disagreement_distance_rust

fn moral_judgment(harm: f64, fairness: f64, loyalty: f64, purity: f64, authority: f64, care: f64) -> f64 {
    0.40 * harm
        + 0.30 * fairness
        + 0.20 * loyalty
        + 0.15 * purity
        + 0.15 * authority
        + 0.25 * care
}

fn main() {
    let judgment_a = moral_judgment(0.8, 0.7, 0.2, 0.1, 0.2, 0.8);
    let judgment_b = moral_judgment(0.3, 0.4, 0.8, 0.7, 0.6, 0.4);
    let distance = (judgment_a - judgment_b).abs();

    println!("Synthetic judgment A: {:.3}", judgment_a);
    println!("Synthetic judgment B: {:.3}", judgment_b);
    println!("Synthetic disagreement distance: {:.3}", distance);
}
