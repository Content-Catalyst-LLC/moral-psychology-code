// Synthetic moral judgment score example for Experimental Moral Psychology.
// Educational scaffold only.
//
// Compile:
//   rustc rust/intuition_judgment_score.rs -o outputs/tables/intuition_judgment_score_rust
// Run:
//   ./outputs/tables/intuition_judgment_score_rust

fn main() {
    let indicators = [
        ("intuition", 0.8_f64, 0.30_f64),
        ("reflection", 0.4, 0.20),
        ("norm_sensitivity", 0.7, 0.25),
        ("consequence_sensitivity", 0.6, 0.25),
    ];

    let score: f64 = indicators
        .iter()
        .map(|(_, value, weight)| value * weight)
        .sum();

    println!("Synthetic moral judgment score: {:.3}", score);
}
