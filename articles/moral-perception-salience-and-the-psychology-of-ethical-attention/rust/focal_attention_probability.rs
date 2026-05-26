// Synthetic focal moral attention probability.
// Educational scaffold only.
//
// Compile:
//   rustc rust/focal_attention_probability.rs -o outputs/tables/focal_attention_probability_rust
// Run:
//   ./outputs/tables/focal_attention_probability_rust

fn logistic(x: f64) -> f64 {
    1.0 / (1.0 + (-x).exp())
}

fn main() {
    let perceived_harm = 0.8_f64;
    let visible_vulnerability = 0.7_f64;
    let emotional_activation = 0.4_f64;
    let mind_perception = 0.8_f64;
    let contextual_framing = 0.5_f64;
    let attentional_competition = 0.3_f64;
    let organized_inattention = 0.4_f64;

    let latent =
        0.60 * perceived_harm
        + 0.50 * visible_vulnerability
        + 0.35 * emotional_activation
        + 0.40 * mind_perception
        + 0.25 * contextual_framing
        - 0.45 * attentional_competition
        - 0.35 * organized_inattention;

    let probability = logistic(latent);

    println!(
        "Synthetic focal moral attention probability: {:.3}",
        probability
    );
}
