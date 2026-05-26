// Synthetic perceived norm extremity score example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/norm_extremity_score.rs -o outputs/tables/norm_extremity_score_rust
// Run:
//   ./outputs/tables/norm_extremity_score_rust

fn main() {
    let visibility_bias = 0.8_f64;
    let algorithmic_amplification = 0.7_f64;
    let outrage_expression = 1.0_f64;
    let cross_group_exposure = 0.4_f64;

    let norm_extremity =
        0.40 * visibility_bias
        + 0.25 * algorithmic_amplification
        + 0.20 * outrage_expression
        - 0.15 * cross_group_exposure;

    println!("Synthetic perceived norm extremity: {:.3}", norm_extremity);
}
