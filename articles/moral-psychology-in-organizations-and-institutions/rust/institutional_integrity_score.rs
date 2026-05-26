// Synthetic institutional integrity score example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/institutional_integrity_score.rs -o outputs/tables/institutional_integrity_score_rust
// Run:
//   ./outputs/tables/institutional_integrity_score_rust

fn main() {
    let accountability_strength = 0.8_f64;
    let speak_up_protection = 0.7_f64;
    let value_alignment = 0.9_f64;
    let cultural_climate = 0.6_f64;
    let corruption_pressure = 0.3_f64;
    let diffusion_responsibility = 0.4_f64;

    let integrity =
        0.30 * accountability_strength
        + 0.30 * speak_up_protection
        + 0.30 * value_alignment
        + 0.20 * cultural_climate
        - 0.30 * corruption_pressure
        - 0.20 * diffusion_responsibility;

    println!("Synthetic institutional integrity score: {:.3}", integrity);
}
