// Synthetic distributed responsibility score example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/distributed_responsibility_score.rs -o outputs/tables/distributed_responsibility_score_rust
// Run:
//   ./outputs/tables/distributed_responsibility_score_rust

fn main() {
    let mut weights = vec![0.10_f64, 0.15, 0.12, 0.18, 0.09, 0.11, 0.13, 0.12];
    let total: f64 = weights.iter().sum();

    for w in &mut weights {
        *w /= total;
    }

    let max_weight = weights
        .iter()
        .copied()
        .fold(f64::NEG_INFINITY, f64::max);

    let distributed_responsibility = 1.0 - max_weight;

    println!(
        "Synthetic distributed responsibility pressure: {:.3}",
        distributed_responsibility
    );
}
