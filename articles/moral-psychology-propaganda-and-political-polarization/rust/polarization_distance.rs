// Synthetic polarization distance example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/polarization_distance.rs -o outputs/tables/polarization_distance_rust
// Run:
//   ./outputs/tables/polarization_distance_rust

fn main() {
    let mean_group_a = 0.75_f64;
    let mean_group_b = -0.45_f64;

    let distance = (mean_group_a - mean_group_b).abs();

    println!("Synthetic polarization distance: {:.3}", distance);
}
