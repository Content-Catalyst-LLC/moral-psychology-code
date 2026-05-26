# Synthetic moral motivation and judgment-action gap model in Julia.
# Educational scaffold only.

using Random
using Statistics

Random.seed!(42)

n = 1000

moral_judgment = randn(n)
emotional_activation = randn(n)
moral_identity = randn(n)
self_regulation = randn(n)
situational_pressure = randn(n)
rationalization_tendency = randn(n)
guilt_recognition = randn(n)
humility = randn(n)
accountability = randn(n)
defensiveness = randn(n)

action_latent =
    0.45 .* moral_judgment .+
    0.30 .* emotional_activation .+
    0.35 .* moral_identity .+
    0.40 .* self_regulation .-
    0.50 .* situational_pressure .-
    0.25 .* rationalization_tendency

moral_action_probability = 1.0 ./ (1.0 .+ exp.(-action_latent))
moral_action = moral_action_probability .>= 0.5
judgment_action_gap = moral_judgment .- Float64.(moral_action)

repair_capacity =
    0.35 .* guilt_recognition .+
    0.35 .* humility .+
    0.30 .* accountability .-
    0.40 .* defensiveness .-
    0.20 .* rationalization_tendency

println("Mean synthetic moral action probability: ", mean(moral_action_probability))
println("Mean synthetic judgment-action gap: ", mean(judgment_action_gap))
println("Mean synthetic repair capacity: ", mean(repair_capacity))

output_dir = joinpath(dirname(@__DIR__), "outputs", "tables")
mkpath(output_dir)

open(joinpath(output_dir, "julia_moral_motivation_gap_summary.csv"), "w") do io
    write(io, "metric,value\n")
    write(io, "mean_moral_action_probability,$(mean(moral_action_probability))\n")
    write(io, "mean_judgment_action_gap,$(mean(judgment_action_gap))\n")
    write(io, "mean_repair_capacity,$(mean(repair_capacity))\n")
    write(io, "mean_situational_pressure,$(mean(situational_pressure))\n")
    write(io, "mean_rationalization_tendency,$(mean(rationalization_tendency))\n")
end
