// Synthetic distributive judgment score example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/distributive_judgment_score.rs -o outputs/tables/distributive_judgment_score_rust
// Run:
//   ./outputs/tables/distributive_judgment_score_rust

fn main() {
    let equality = 0.7_f64;
    let equity = 0.4_f64;
    let need = 0.8_f64;
    let desert = 0.3_f64;
    let priority = 0.6_f64;
    let self_interest_bias = 0.2_f64;
    let procedural_trust = 0.5_f64;
    let group_distance = 0.1_f64;
    let historical_repair = 0.7_f64;

    let score =
        0.30 * equality
        + 0.25 * equity
        + 0.25 * need
        + 0.20 * desert
        + 0.25 * priority
        - 0.35 * self_interest_bias
        + 0.20 * procedural_trust
        - 0.20 * group_distance
        + 0.20 * historical_repair;

    println!("Synthetic distributive judgment score: {:.3}", score);
}
