// Synthetic diversification score for historical moral psychology emphases.
// Educational scaffold only.
//
// Compile:
//   rustc rust/diversification_score.rs -o outputs/tables/diversification_score_rust
// Run:
//   ./outputs/tables/diversification_score_rust

fn main() {
    let values = vec![0.45_f64, 0.40, 0.45, 0.75, 0.85, 0.80, 0.90];

    let total: f64 = values.iter().sum();

    let entropy: f64 = values
        .iter()
        .map(|value| value / total)
        .filter(|p| *p > 0.0)
        .map(|p| -p * p.ln())
        .sum();

    let normalized = entropy / (values.len() as f64).ln();

    println!("Synthetic normalized diversification score: {:.3}", normalized);
}
