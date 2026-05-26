// Synthetic stage-like moral reasoning category.
// Educational scaffold only.
//
// Compile:
//   rustc rust/reasoning_stage.rs -o outputs/tables/reasoning_stage_rust
// Run:
//   ./outputs/tables/reasoning_stage_rust

fn main() {
    let age = 15.0_f64;
    let perspective_taking = 0.7_f64;
    let norm_exposure = 0.4_f64;
    let domain_differentiation = 0.8_f64;
    let peer_cooperation = 0.6_f64;
    let cultural_context_support = 0.5_f64;
    let authority_orientation = 0.3_f64;

    let latent_reasoning =
        0.10 * age
        + 0.55 * perspective_taking
        + 0.35 * norm_exposure
        + 0.45 * domain_differentiation
        + 0.25 * peer_cooperation
        + 0.20 * cultural_context_support
        - 0.20 * authority_orientation;

    let stage = if latent_reasoning < -0.75 {
        "Stage_1_2"
    } else if latent_reasoning < 0.25 {
        "Stage_3_4"
    } else {
        "Stage_5_6"
    };

    println!("Synthetic latent reasoning: {:.3}", latent_reasoning);
    println!("Synthetic stage-like category: {}", stage);
}
