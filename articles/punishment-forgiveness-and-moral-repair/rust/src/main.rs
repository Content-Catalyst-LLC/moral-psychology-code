fn moral_agency(
    perception: f64,
    judgment: f64,
    emotion: f64,
    identity: f64,
    regulation: f64,
    repair: f64,
    failure: f64,
) -> f64 {
    0.13 * perception +
    0.13 * judgment +
    0.12 * emotion +
    0.14 * identity +
    0.14 * regulation +
    0.12 * repair -
    0.16 * failure
}

fn main() {
    let score = moral_agency(0.72, 0.70, 0.62, 0.68, 0.64, 0.58, 0.32);
    println!("Moral agency score: {:.3}", score);
}
