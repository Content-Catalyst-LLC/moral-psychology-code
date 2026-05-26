// Synthetic polarization distance example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/polarization_distance.rs -o outputs/tables/polarization_distance_rust
// Run:
//   ./outputs/tables/polarization_distance_rust

fn main() {
    let group_a_mean = 0.72_f64;
    let group_b_mean = -0.38_f64;

    let distance = (group_a_mean - group_b_mean).abs();

    println!("Synthetic polarization distance: {:.3}", distance);
}
