// Synthetic cultural moral-profile distance example.
// Educational scaffold only.
//
// Compile:
//   rustc rust/cultural_profile_distance.rs -o outputs/tables/cultural_profile_distance_rust
// Run:
//   ./outputs/tables/cultural_profile_distance_rust

fn main() {
    let context_a = [0.45_f64, 0.30, 0.10, 0.10, 0.05, 0.10];
    let context_b = [0.25_f64, 0.20, 0.30, 0.25, 0.20, 0.25];

    let mut total = 0.0_f64;

    for i in 0..context_a.len() {
        let diff = context_a[i] - context_b[i];
        total += diff * diff;
    }

    let distance = total.sqrt();

    println!("Synthetic cultural moral-profile distance: {:.3}", distance);
}
