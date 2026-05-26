// Synthetic relevance score example for "Why Moral Psychology Matters Today".
// Educational scaffold only.
//
// Compile:
//   rustc rust/relevance_score.rs -o outputs/tables/relevance_score_rust
// Run:
//   ./outputs/tables/relevance_score_rust

fn main() {
    let variables = [
        ("political_polarization", 1.2_f64, 0.25_f64),
        ("organizational_risk", 0.8, 0.20),
        ("developmental_moral_learning", 0.4, 0.15),
        ("cross_cultural_variation", 0.5, 0.15),
        ("technology_amplification", 1.0, 0.15),
        ("moral_injury_burden", 0.9, 0.20),
    ];

    let score: f64 = variables
        .iter()
        .map(|(_, value, weight)| value * weight)
        .sum();

    println!("Synthetic moral psychology relevance score: {:.3}", score);
}
