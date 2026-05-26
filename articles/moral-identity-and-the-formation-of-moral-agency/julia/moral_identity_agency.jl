# Synthetic moral identity and moral agency model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

internalization = randn(n)
symbolization = randn(n)
narrative_integration = randn(n)
norm_integration = randn(n)
moral_judgment = randn(n)
self_regulatory_capacity = randn(n)
situational_pressure = randn(n)
guilt_recognition = randn(n)
humility = randn(n)
accountability = randn(n)
defensiveness = randn(n)

moral_identity =
    0.50 .* internalization .+
    0.22 .* symbolization .+
    0.35 .* narrative_integration .+
    0.30 .* norm_integration

action_latent =
    0.35 .* moral_judgment .+
    0.45 .* moral_identity .+
    0.30 .* self_regulatory_capacity .-
    0.40 .* situational_pressure

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))

repair_capacity =
    0.35 .* guilt_recognition .+
    0.35 .* humility .+
    0.30 .* accountability .-
    0.45 .* defensiveness .+
    0.20 .* moral_identity

println("Mean synthetic moral identity: ", mean(moral_identity))
println("Mean synthetic action probability: ", mean(moral_action_probability))
println("Mean synthetic repair capacity: ", mean(repair_capacity))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_identity_agency_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_identity,$(mean(moral_identity))\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "mean_repair_capacity,$(mean(repair_capacity))\n")
    write(io, "mean_situational_pressure,$(mean(situational_pressure))\n")
    write(io, "mean_defensiveness,$(mean(defensiveness))\n")
end
