// Synthetic measurement score example for Methods in Moral Psychology.
// Educational scaffold only.
//
// Compile:
//   rustc rust/measurement_score.rs -o outputs/tables/measurement_score_rust
// Run:
//   ./outputs/tables/measurement_score_rust

fn main() {
    let indicators = [
        ("wrongness", 0.8_f64, 0.35_f64),
        ("blame", 0.6, 0.30),
        ("norm_learning", 0.7, 0.20),
        ("action_tendency", 0.5, 0.15),
    ];

    let score: f64 = indicators
        .iter()
        .map(|(_, value, weight)| value * weight)
        .sum();

    println!("Synthetic latent moral construct score: {:.3}", score);
}
