# Toy moral-agency dynamic update model.
# Educational only.

moral_agency = 0.42
moral_judgment = 0.70
moral_emotion = 0.62
moral_identity = 0.68
self_regulation = 0.64
prosocial_practice = 0.58
failure_dynamics = 0.32
rate = 0.08

for t in 1:20
    moral_agency = moral_agency +
        rate * (
            0.17 * moral_judgment +
            0.15 * moral_emotion +
            0.18 * moral_identity +
            0.18 * self_regulation +
            0.16 * prosocial_practice -
            0.20 * failure_dynamics
        )

    moral_agency = clamp(moral_agency, 0.0, 1.0)
    println("Time ", t, ": moral agency = ", round(moral_agency, digits=3))
end
